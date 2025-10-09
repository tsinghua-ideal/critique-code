int main(int argc, char *argv[]) {
  // get test number from command line
  if (argc != 3) {
    std::cerr << "Usage: " << argv[0] << " <test_number> <snapshot_name>"
              << std::endl;
    return 1;
  }
  int testNumber = std::stoi(argv[1]);
  std::string snapshotName = argv[2];

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

  std::chrono::steady_clock::time_point begin =
      std::chrono::steady_clock::now();

  // run the tests
  for (int i = 0; i < testNumber; i++) {
    oneTest();
    if (i != 0 && (i % 20 == 0)) {
      std::chrono::steady_clock::time_point elapsed =
          std::chrono::steady_clock::now();
      std::cout << "Completed " << i << " tests in "
                << std::chrono::duration_cast<std::chrono::seconds>(elapsed -
                                                                    begin)
                       .count()
                << " s" << std::endl;
    }
  }

  // dump topk desc into file
  for (auto i = 0; i != 32; ++i) {
    auto &topk = topks[i];
    topk.save_snapshot(snapshotName + "." + std::to_string(i) + ".txt");
  }

  return 0;
}
