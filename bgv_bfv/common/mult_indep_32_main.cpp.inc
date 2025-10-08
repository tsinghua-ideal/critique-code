int main(int argc, char *argv[]) {
  // get test number from command line
  if (argc != 2) {
    std::cerr << "Usage: " << argv[0] << " <test_number>" << std::endl;
    return 1;
  }
  int testNumber = std::stoi(argv[1]);

  auto cryptoContext = mult_indep__generate_crypto_context();
  std::cout << *(cryptoContext->GetCryptoParameters()) << std::endl;
  auto keyPair = cryptoContext->KeyGen();
  auto publicKey = keyPair.publicKey;
  auto secretKey = keyPair.secretKey;
  cryptoContext =
      mult_indep__configure_crypto_context(cryptoContext, secretKey);

  int16_t arg0 = 1;
  int64_t expected = 1;

  auto oneTest = [&]() {
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
