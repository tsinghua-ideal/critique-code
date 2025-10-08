int main(int argc, char *argv[]) {
  // get test number from command line
  if (argc != 3) {
    std::cerr << "Usage: " << argv[0] << " <test_number>" << " <thread_number>"
              << std::endl;
  }
  int testNumber = std::stoi(argv[1]);
  int threadNumber = std::stoi(argv[2]);

  auto cryptoContext = mult_dep__generate_crypto_context();
  std::cout << *(cryptoContext->GetCryptoParameters()) << std::endl;
  auto keyPair = cryptoContext->KeyGen();
  auto publicKey = keyPair.publicKey;
  auto secretKey = keyPair.secretKey;
  cryptoContext = mult_dep__configure_crypto_context(cryptoContext, secretKey);

  int16_t arg0 = 1;
  int64_t expected = 1;

  auto oneTest = [&]() {
    auto arg0Encrypted =
        mult_dep__encrypt__arg0(cryptoContext, arg0, publicKey);
    auto outputEncrypted = mult_dep(cryptoContext, secretKey, arg0Encrypted);
    auto actual =
        mult_dep__decrypt__result0(cryptoContext, outputEncrypted, secretKey);

    if (expected != actual) {
      std::cerr << "Test failed: expected " << expected << ", got " << actual
                << std::endl;
    }
  };

  // run the tests
  std::vector<std::thread> threads;
  for (int t = 0; t < threadNumber; t++) {
    threads.emplace_back([&]() {
      for (int i = 0; i < testNumber / threadNumber; i++) {
        oneTest();
      }
    });
  }
  for (auto &th : threads) {
    th.join();
  }

  // output the noise quantiles
  for (unsigned i = 0; i != topks.size(); ++i) {
    auto &topk = topks[i];
    auto n10 = approxLog2(*topk.quantile(1.0 - std::exp2(-10)));
    auto n12 = approxLog2(*topk.quantile(1.0 - std::exp2(-12)));
    auto n14 = approxLog2(*topk.quantile(1.0 - std::exp2(-14)));
    auto n16 = approxLog2(*topk.quantile(1.0 - std::exp2(-16)));
    auto n18 = approxLog2(*topk.quantile(1.0 - std::exp2(-18)));
    auto n20 = approxLog2(*topk.quantile(1.0 - std::exp2(-20)));
    auto n22 = approxLog2(*topk.quantile(1.0 - std::exp2(-22)));
    auto n24 = approxLog2(*topk.quantile(1.0 - std::exp2(-24)));
    auto max = approxLog2(*topk.quantile(1.0));
    std::cout << "TopK noise for arg" << i << ": n10=" << n10 << ", n12=" << n12
              << ", n14=" << n14 << ", n16=" << n16 << ", n18=" << n18
              << ", n20=" << n20 << ", n22=" << n22 << ", n24=" << n24
              << ", max=" << max << std::endl;
  }

  return 0;
}
