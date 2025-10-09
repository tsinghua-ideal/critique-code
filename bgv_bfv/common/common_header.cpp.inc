#include <cmath>
#include <cstddef>
#include <cstdint>
#include <iostream>
#include <map>
#include <optional>
#include <ostream>
#include <queue>
#include <string>
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
    ++N_;
    if (N_ != 0 && N_ % (1000 * (32768)) == 0) {
      std::cout << "TopK: seen " << N_ / 32768 << " items, heap size "
                << heap_.size() << std::endl;
    }
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
  CountT count() const { return N_; }

  // Return top-K values with counts, sorted descending by value
  std::vector<std::pair<IntT, CountT>> topk_desc() {
    ensure_sorted_heap_values();
    std::vector<std::pair<IntT, CountT>> out;
    out.reserve(asc_values_.size());
    for (std::size_t i = asc_values_.size(); i-- > 0;) {
      IntT v = asc_values_[i];
      out.emplace_back(v, get_count(v));
    }
    return out;
  }

  // Text snapshot: writes magic, version, K (from file), N, M, then M lines of
  // "value count".
  // Requires IntT to be streamable with operator<< and operator>>.
  bool save_snapshot(const std::string &path) const {
    std::ofstream ofs(path, std::ios::out | std::ios::trunc);
    if (!ofs)
      return false;

    // ---- take snapshot under lock ----
    std::vector<IntT> asc_values;
    CountT N_snap;
    {
      N_snap = N_;

      auto tmp = heap_;
      asc_values.clear();
      asc_values.reserve(tmp.size());
      while (!tmp.empty()) {
        asc_values.push_back(tmp.top());
        tmp.pop();
      }
      std::sort(asc_values.begin(), asc_values.end()); // ascending
    }
    // ---- write outside lock ----
    constexpr const char *kMagic = "TKTC1";
    ofs << kMagic << "\n";
    ofs << K_ << "\n";                // K as stored in the file (for info)
    ofs << N_snap << "\n";            // total items seen
    ofs << asc_values.size() << "\n"; // M = #distinct values in heap

    // We also need counts for those values; read them under lock one-by-one
    for (const auto &v : asc_values) {
      CountT c;
      {
        auto it = counts_.find(v);
        c = (it == counts_.end()) ? CountT(0) : it->second;
      }
      ofs << v << " " << c << "\n";
      if (!ofs)
        return false;
    }
    return true;
  }

  // Read a snapshot file (same format as save_snapshot) and MERGE it into this
  // instance.
  // Keeps your current K_. After merging, heap_ contains the global top-K
  // DISTINCT values across old + new, and counts_ holds their aggregated
  // multiplicities. Returns false on parse/format errors.
  bool merge_snapshot(const std::string &path) {
    std::ifstream ifs(path);
    if (!ifs)
      return false;

    std::string magic;
    if (!std::getline(ifs, magic))
      return false;
    if (magic != "TKTC1")
      return false;

    std::size_t K_file = 0;
    CountT N_file = 0;
    std::size_t M = 0;

    if (!(ifs >> K_file))
      return false;
    if (!(ifs >> N_file))
      return false;
    if (!(ifs >> M))
      return false;
    ifs.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

    // Read all entries first so we can fail safely without mutating state.
    std::vector<std::pair<IntT, CountT>> entries;
    entries.reserve(M);
    for (std::size_t i = 0; i < M; ++i) {
      std::string vstr;
      CountT c;
      if (!(ifs >> vstr >> c))
        return false;
      IntT v(vstr);
      ifs.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
      entries.emplace_back(std::move(v), c);
    }

    // Increase total population
    N_ += N_file;

    if (K_ == 0) {
      // We don't track any values in this configuration; done.
      return true;
    }

    // For each (value,count) from snapshot:
    for (auto &[v, c] : entries) {
      // If we're already tracking this value, just add its count.
      if (in_heap_.count(v)) {
        auto it = counts_.find(v);
        if (it != counts_.end()) {
          it->second += c;
        } else {
          // Shouldn't happen if in_heap_ is consistent, but be defensive.
          counts_[v] = c;
        }
        continue;
      }

      // Decide whether this value belongs in the global top-K by value.
      if (heap_.size() < K_) {
        // Space available: admit directly.
        heap_.push(v);
        in_heap_.insert(v);
        counts_[v] = c;
      } else if (v > heap_.top()) {
        // Evict current smallest tracked value; replace with v.
        IntT ev = heap_.top();
        heap_.pop();
        in_heap_.erase(ev);
        counts_.erase(ev);

        heap_.push(v);
        in_heap_.insert(v);
        counts_[v] =
            c; // start with c; if v appears again later, we'll add to it
      } else {
        // v is not among the K largest distinct values globally; ignore its
        // count (we still increased N_ above, which is correct for quantile
        // ranks).
      }
    }
    return true;
  }

private:
  struct MinCmp {
    bool operator()(const IntT &a, const IntT &b) const {
      return a > b;
    } // min-heap by value
  };

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
