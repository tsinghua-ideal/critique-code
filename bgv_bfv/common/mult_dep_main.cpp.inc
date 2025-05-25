int main(int argc, char* argv[]) {
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

  // init the maxNoise
  for (unsigned i = 0; i != maxNoise.size(); ++i) {
    maxNoise[i] = 0;
  }

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

  // output the max noise
  for (unsigned i = 0; i != maxNoise.size(); ++i) {
    std::cout << "maxNoise[" << i << "] = " << maxNoise[i] << std::endl;
  }

  return 0;
}
