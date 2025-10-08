int main(int argc, char *argv[]) {
  // get test number from command line
  if (argc != 3) {
    std::cerr << "Usage: " << argv[0] << " <test_number>" << " <thread_number>"
              << std::endl;
    return 1;
  }
  int testNumber = std::stoi(argv[1]);
  int threadNumber = std::stoi(argv[2]);

  auto cryptoContext = mult_indep__generate_crypto_context();
  std::cout << *(cryptoContext->GetCryptoParameters()) << std::endl;
  auto keyPair = cryptoContext->KeyGen();
  auto publicKey = keyPair.publicKey;
  auto secretKey = keyPair.secretKey;
  cryptoContext =
      mult_indep__configure_crypto_context(cryptoContext, secretKey);

  int16_t arg0 = 1;
  int64_t expected = 1;

  [[maybe_unused]] auto oneTest = [&]() {
    auto arg0Encrypted =
        mult_indep__encrypt__arg0(cryptoContext, arg0, publicKey);
    auto arg1Encrypted =
        mult_indep__encrypt__arg1(cryptoContext, arg0, publicKey);
    auto arg2Encrypted =
        mult_indep__encrypt__arg2(cryptoContext, arg0, publicKey);
    auto arg3Encrypted =
        mult_indep__encrypt__arg3(cryptoContext, arg0, publicKey);
    auto arg4Encrypted =
        mult_indep__encrypt__arg4(cryptoContext, arg0, publicKey);
    auto arg5Encrypted =
        mult_indep__encrypt__arg5(cryptoContext, arg0, publicKey);
    auto arg6Encrypted =
        mult_indep__encrypt__arg6(cryptoContext, arg0, publicKey);
    auto arg7Encrypted =
        mult_indep__encrypt__arg7(cryptoContext, arg0, publicKey);
    auto arg8Encrypted =
        mult_indep__encrypt__arg8(cryptoContext, arg0, publicKey);
    auto arg9Encrypted =
        mult_indep__encrypt__arg9(cryptoContext, arg0, publicKey);
    auto arg10Encrypted =
        mult_indep__encrypt__arg10(cryptoContext, arg0, publicKey);
    auto arg11Encrypted =
        mult_indep__encrypt__arg11(cryptoContext, arg0, publicKey);
    auto arg12Encrypted =
        mult_indep__encrypt__arg12(cryptoContext, arg0, publicKey);
    auto arg13Encrypted =
        mult_indep__encrypt__arg13(cryptoContext, arg0, publicKey);
    auto arg14Encrypted =
        mult_indep__encrypt__arg14(cryptoContext, arg0, publicKey);
    auto arg15Encrypted =
        mult_indep__encrypt__arg15(cryptoContext, arg0, publicKey);
    auto arg16Encrypted =
        mult_indep__encrypt__arg16(cryptoContext, arg0, publicKey);
    auto arg17Encrypted =
        mult_indep__encrypt__arg17(cryptoContext, arg0, publicKey);
    auto arg18Encrypted =
        mult_indep__encrypt__arg18(cryptoContext, arg0, publicKey);
    auto arg19Encrypted =
        mult_indep__encrypt__arg19(cryptoContext, arg0, publicKey);
    auto arg20Encrypted =
        mult_indep__encrypt__arg20(cryptoContext, arg0, publicKey);
    auto arg21Encrypted =
        mult_indep__encrypt__arg21(cryptoContext, arg0, publicKey);
    auto arg22Encrypted =
        mult_indep__encrypt__arg22(cryptoContext, arg0, publicKey);
    auto arg23Encrypted =
        mult_indep__encrypt__arg23(cryptoContext, arg0, publicKey);
    auto arg24Encrypted =
        mult_indep__encrypt__arg24(cryptoContext, arg0, publicKey);
    auto arg25Encrypted =
        mult_indep__encrypt__arg25(cryptoContext, arg0, publicKey);
    auto arg26Encrypted =
        mult_indep__encrypt__arg26(cryptoContext, arg0, publicKey);
    auto arg27Encrypted =
        mult_indep__encrypt__arg27(cryptoContext, arg0, publicKey);
    auto arg28Encrypted =
        mult_indep__encrypt__arg28(cryptoContext, arg0, publicKey);
    auto arg29Encrypted =
        mult_indep__encrypt__arg29(cryptoContext, arg0, publicKey);
    auto arg30Encrypted =
        mult_indep__encrypt__arg30(cryptoContext, arg0, publicKey);
    auto arg31Encrypted =
        mult_indep__encrypt__arg31(cryptoContext, arg0, publicKey);
    auto outputEncrypted = mult_indep(
        cryptoContext, secretKey, arg0Encrypted, arg1Encrypted, arg2Encrypted,
        arg3Encrypted, arg4Encrypted, arg5Encrypted, arg6Encrypted,
        arg7Encrypted, arg8Encrypted, arg9Encrypted, arg10Encrypted,
        arg11Encrypted, arg12Encrypted, arg13Encrypted, arg14Encrypted,
        arg15Encrypted, arg16Encrypted, arg17Encrypted, arg18Encrypted,
        arg19Encrypted, arg20Encrypted, arg21Encrypted, arg22Encrypted,
        arg23Encrypted, arg24Encrypted, arg25Encrypted, arg26Encrypted,
        arg27Encrypted, arg28Encrypted, arg29Encrypted, arg30Encrypted,
        arg31Encrypted);
    auto actual =
        mult_indep__decrypt__result0(cryptoContext, outputEncrypted, secretKey);

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
