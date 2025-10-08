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
std::map<std::thread::id, int> thread2counter;

void __heir_debug(CryptoContextT cc, PrivateKeyT sk, CiphertextT ct,
                  const std::map<std::string, std::string> &debugAttrMap) {
  auto thread_id = std::this_thread::get_id();
  if (thread2counter.find(thread_id) == thread2counter.end()) {
    thread2counter[thread_id] = 0;
  }
  auto &count = thread2counter[thread_id];
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

  update_topk(topks[count], b.CRTInterpolate());
  count++;
#endif
}
