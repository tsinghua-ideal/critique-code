// DecryptCore not accessible from CryptoContext
// so copy from @openfhe//src/pke/lib/schemerns/rns-pke.cpp
DCRTPoly DecryptCore(const std::vector<DCRTPoly> &cv,
                     const PrivateKey<DCRTPoly> privateKey) {
  const DCRTPoly &s = privateKey->GetPrivateElement();

  size_t sizeQ = s.GetParams()->GetParams().size();
  size_t sizeQl = cv[0].GetParams()->GetParams().size();

  size_t diffQl = sizeQ - sizeQl;

  auto scopy(s);
  scopy.DropLastElements(diffQl);

  DCRTPoly sPower(scopy);

  DCRTPoly b(cv[0]);
  b.SetFormat(Format::EVALUATION);

  DCRTPoly ci;
  for (size_t i = 1; i < cv.size(); i++) {
    ci = cv[i];
    ci.SetFormat(Format::EVALUATION);

    b += sPower * ci;
    sPower *= scopy;
  }
  return b;
}

#define OP
#define NOISE

std::array<TopK, 32> topks;

void __heir_debug(CryptoContextT cc, PrivateKeyT sk, CiphertextT ct,
                  const std::map<std::string, std::string> &debugAttrMap) {
  static int count = 0;
  // count from 0 to 31
  // for indep case, the last argument is 0
#ifdef OP
  auto isBlockArgument = debugAttrMap.at("asm.is_block_arg");
  if (isBlockArgument == "1") {
    // reset count for this test
    count = 0;
  } else {
    if (debugAttrMap.at("asm.op_name") == "openfhe.relin") {
      // skip relin op
      return;
    }
  }
#endif

#ifdef NOISE
  auto cv = ct->GetElements();

  auto b = DecryptCore(cv, sk);
  b.SetFormat(Format::COEFFICIENT);

  // B/FV specific
  // from @openfhe//src/pke/extras/bfv-mult-bug.cpp
  const auto cryptoParams = std::static_pointer_cast<CryptoParametersBFVRNS>(
      sk->GetCryptoParameters());

  const auto encParams = cryptoParams->GetElementParams();
  NativeInteger NegQModt = cryptoParams->GetNegQModt();
  NativeInteger NegQModtPrecon = cryptoParams->GetNegQModtPrecon();
  const NativeInteger t = cryptoParams->GetPlaintextModulus();
  std::vector<NativeInteger> tInvModq = cryptoParams->GettInvModq();

  // Get a new plaintext with full slots
  // SetLength(8) above will truncate the plaintext
  PlaintextT newPtxt;
  cc->Decrypt(sk, ct, &newPtxt);
  // Repack to convert from NativePoly to DCRTPoly
  std::vector<int64_t> value = newPtxt->GetPackedValue();
  Plaintext repack = cc->MakePackedPlaintext(value);
  DCRTPoly plain = repack->GetElement<DCRTPoly>();
  plain.SetFormat(Format::COEFFICIENT);
  plain.TimesQovert(encParams, tInvModq, t, NegQModt, NegQModtPrecon);

  // remove the message, leave only the noise
  DCRTPoly res;
  res = b - plain;

  update_topk(topks[count], res.CRTInterpolate());
  count++;
#endif
}
