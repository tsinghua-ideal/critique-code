#include <cmath>
#include <cstddef>
#include <cstdint>
#include <iostream>
#include <map>
#include <mutex>
#include <optional>
#include <ostream>
#include <queue>
#include <string>
#include <thread>
#include <vector>

#include "openfhe.h"

using namespace lbcrypto;

template <class IntT = std::int64_t, class CountT = std::uint64_t>
class TopKTailWithCounts {
public:
  // 48000 = (2 ** 15) * (60k) * (2 ** -12)
  TopKTailWithCounts()
      : K_(48000), N_(0), heap_dirty_(true), index_dirty_(true) {}

  // Add one integer observation
  void update(const IntT x) {
    std::lock_guard<std::mutex> lk(mu_);
    ++N_;
    auto &c = counts_[x];
    c += 1;

    // If x already present in heap set, nothing to do for heap ordering.
    if (in_heap_.find(x) != in_heap_.end()) {
      index_dirty_ = true;
      return;
    }
    // Otherwise, consider placing x into top-K values-by-key
    if (K_ == 0)
      return;

    if (heap_.size() < K_) {
      push_heap_value(x);
    } else if (x > heap_.top()) {
      // evict current smallest value
      in_heap_.erase(heap_.top());
      heap_.pop();
      push_heap_value(x);
    }
  }

  // Exact q-quantile if covered by current top-K *values* (with counts).
  // Returns nullopt if tail mass required exceeds mass within top-K values.
  std::optional<IntT> quantile(double q) {
    std::lock_guard<std::mutex> lk(mu_);
    if (N_ == 0 || K_ == 0)
      return std::nullopt;
    if (q <= 0.0)
      return min_value_in_heap();
    if (q >= 1.0)
      return max_value_in_heap();

    // r = ceil((1 - q) * N) items in the upper tail to cover
    long double need =
        (1.0L - static_cast<long double>(q)) * static_cast<long double>(N_);
    CountT r = static_cast<CountT>(std::floor(need + 1e-12L));
    if (need > 0 && static_cast<long double>(r) < need)
      ++r; // ceil
    if (r == 0)
      r = 1;

    // Build a sorted (ascending) list of the K values currently in the heap.
    ensure_sorted_heap_values(); // asc_values_
    // Compute total mass (counts) in the heap's values.
    CountT tail_mass = 0;
    for (auto v : asc_values_)
      tail_mass += get_count(v);
    if (r > tail_mass)
      return std::nullopt; // not enough coverage

    // Walk from largest to smaller, summing counts until reaching r
    CountT acc = 0;
    for (std::size_t i = asc_values_.size(); i-- > 0;) {
      IntT v = asc_values_[i];
      CountT c = get_count(v);
      acc += c;
      if (acc >= r)
        return v;
    }
    return std::nullopt; // should not happen if logic above is correct
  }

  // Total number of observations
  CountT count() const {
    std::lock_guard<std::mutex> lk(mu_);
    return N_;
  }

  // Return top-K values with counts, sorted descending by value
  std::vector<std::pair<IntT, CountT>> topk_desc() {
    std::lock_guard<std::mutex> lk(mu_);
    ensure_sorted_heap_values();
    std::vector<std::pair<IntT, CountT>> out;
    out.reserve(asc_values_.size());
    for (std::size_t i = asc_values_.size(); i-- > 0;) {
      IntT v = asc_values_[i];
      out.emplace_back(v, get_count(v));
    }
    return out;
  }

private:
  struct MinCmp {
    bool operator()(const IntT &a, const IntT &b) const {
      return a > b;
    } // min-heap by value
  };

  // These helpers require caller to hold mu_
  void push_heap_value(const IntT v) {
    heap_.push(v);
    in_heap_.insert(v);
    heap_dirty_ = true;
    index_dirty_ = true;
  }

  void ensure_sorted_heap_values() {
    if (!heap_dirty_)
      return;
    // Copy heap to vector and sort ascending by value
    std::priority_queue<IntT, std::vector<IntT>, MinCmp> tmp = heap_;
    asc_values_.clear();
    asc_values_.reserve(tmp.size());
    while (!tmp.empty()) {
      asc_values_.push_back(tmp.top());
      tmp.pop();
    }
    // asc_values_ is ascending
    heap_dirty_ = false;
  }

  std::optional<IntT> max_value_in_heap() {
    ensure_sorted_heap_values();
    if (asc_values_.empty())
      return std::nullopt;
    return asc_values_.back();
  }
  std::optional<IntT> min_value_in_heap() {
    ensure_sorted_heap_values();
    if (asc_values_.empty())
      return std::nullopt;
    return asc_values_.front();
  }

  CountT get_count(const IntT v) const {
    auto it = counts_.find(v);
    return it == counts_.end() ? CountT(0) : it->second;
  }

  // Config / state
  const std::size_t K_;
  CountT N_;

  // Mutex
  mutable std::mutex mu_;

  // Counts for all observed values
  std::map<IntT, CountT> counts_;

  // Min-heap of the largest K *values* (distinct keys)
  std::priority_queue<IntT, std::vector<IntT>, MinCmp> heap_;
  std::set<IntT> in_heap_; // membership check

  // Cached ascending list of heap values for queries
  std::vector<IntT> asc_values_;
  bool heap_dirty_;
  bool index_dirty_;
};

using TopK = TopKTailWithCounts<BigInteger, uint64_t>;

void update_topk(TopK &topk, DCRTPoly::PolyLargeType noise) {
  usint vlen{noise.GetParams()->GetRingDimension()};
  const auto &q{noise.GetParams()->GetModulus()};
  const auto &half{q >> 1};
  for (usint i = 0; i < vlen; i++) {
    auto &val = (noise.GetValues())[i];
    if (val > half)
      // negative
      topk.update(q - val);
    else
      topk.update(val);
  }
}

double approxLog2(BigInteger n) {
  auto lognceil = n.GetMSB();
  int nextBits[10];
  auto prevInt = n;
  for (int i = 0; i < 10; i++) {
    n.GetBitAtIndex(lognceil - i - 1) ? nextBits[i] = 1 : nextBits[i] = 0;
  }
  // now construct nextBits into 1.b1b2b3b4b5b6b7b8b9b10
  double frac = 1.0;
  for (int i = 0; i < 10; i++) {
    frac += nextBits[i] * std::pow(2.0, -(i + 1));
  }
  return (lognceil - 1) + log2(frac);
}
