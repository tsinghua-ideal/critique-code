#include "common_header.cpp.inc"

int main(int argc, char *argv[]) {
  // get test number from command line
  if (argc != 3) {
    std::cerr << "Usage: " << argv[0] << " <snapshot_name> <batch_count>"
              << std::endl;
    return 1;
  }
  std::string snapshotName = argv[1];
  int batchCount = std::stoi(argv[2]);

  std::array<TopK, 32> topks;

  for (auto j = 0; j != batchCount; ++j) {
    for (auto i = 0; i != 32; ++i) {
      std::string name = snapshotName + "." + std::to_string(j) + "." +
                         std::to_string(i) + ".txt";
      topks[i].merge_snapshot(name);
    }
    std::cout << "Merged batch " << j << std::endl;
  }

  // output the noise quantiles
  for (unsigned i = 0; i != topks.size(); ++i) {
    auto &topk = topks[i];
    auto n12 = *topk.quantile(1.0 - std::exp2(-12));
    auto n16 = *topk.quantile(1.0 - std::exp2(-16));
    auto n20 = *topk.quantile(1.0 - std::exp2(-20));
    auto n24 = *topk.quantile(1.0 - std::exp2(-24));
    auto max = *topk.quantile(1.0);
    auto log2n12 = approxLog2(n12);
    auto log2n16 = approxLog2(n16);
    auto log2n20 = approxLog2(n20);
    auto log2n24 = approxLog2(n24);
    auto log2max = approxLog2(max);
    std::cout << "TopK noise for arg" << i << ": n12=" << log2n12
              << ", n16=" << log2n16 << ", n20=" << log2n20
              << ", n24=" << log2n24 << ", max=" << log2max
              << " count=" << topk.count() << std::endl;
  }
}