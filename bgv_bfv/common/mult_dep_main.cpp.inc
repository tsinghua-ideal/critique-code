int main(int argc, char *argv[]) {
  // get test number from command line
  if (argc != 2) {
    std::cerr << "Usage: " << argv[0] << " <test_number>" << std::endl;
    return 1;
  }
  int testNumber = std::stoi(argv[1]);

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
  for (int i = 0; i < testNumber; i++) {
    oneTest();
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
              << ", n24=" << log2n24 << ", max=" << log2max << std::endl;
  }

  return 0;
}
