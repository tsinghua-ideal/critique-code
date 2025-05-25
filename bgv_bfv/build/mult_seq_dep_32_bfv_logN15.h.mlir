!Z35184372744193_i64 = !mod_arith.int<35184372744193 : i64>
!Z35184373006337_i64 = !mod_arith.int<35184373006337 : i64>
!Z35184373989377_i64 = !mod_arith.int<35184373989377 : i64>
!Z35184376545281_i64 = !mod_arith.int<35184376545281 : i64>
!Z35184377331713_i64 = !mod_arith.int<35184377331713 : i64>
!Z35184378511361_i64 = !mod_arith.int<35184378511361 : i64>
!Z35184378707969_i64 = !mod_arith.int<35184378707969 : i64>
!Z35184379035649_i64 = !mod_arith.int<35184379035649 : i64>
!Z65537_i64 = !mod_arith.int<65537 : i64>
!cc = !openfhe.crypto_context
!params = !openfhe.cc_params
!pk = !openfhe.public_key
!sk = !openfhe.private_key
#full_crt_packing_encoding = #lwe.full_crt_packing_encoding<scaling_factor = 0>
#key = #lwe.key<>
#modulus_chain_L7_C7 = #lwe.modulus_chain<elements = <35184372744193 : i64, 35184373006337 : i64, 35184373989377 : i64, 35184376545281 : i64, 35184377331713 : i64, 35184378511361 : i64, 35184378707969 : i64, 35184379035649 : i64>, current = 7>
!rns_L7 = !rns.rns<!Z35184372744193_i64, !Z35184373006337_i64, !Z35184373989377_i64, !Z35184376545281_i64, !Z35184377331713_i64, !Z35184378511361_i64, !Z35184378707969_i64, !Z35184379035649_i64>
#ring_Z65537_i64_1_x1024 = #polynomial.ring<coefficientType = !Z65537_i64, polynomialModulus = <1 + x**1024>>
#ring_rns_L7_1_x1024 = #polynomial.ring<coefficientType = !rns_L7, polynomialModulus = <1 + x**1024>>
!pt = !lwe.new_lwe_plaintext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x1024, encoding = #full_crt_packing_encoding>>
#ciphertext_space_L7 = #lwe.ciphertext_space<ring = #ring_rns_L7_1_x1024, encryption_type = msb>
#ciphertext_space_L7_D3 = #lwe.ciphertext_space<ring = #ring_rns_L7_1_x1024, encryption_type = msb, size = 3>
!ct_L7 = !lwe.new_lwe_ciphertext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x1024, encoding = #full_crt_packing_encoding>, ciphertext_space = #ciphertext_space_L7, key = #key, modulus_chain = #modulus_chain_L7_C7>
!ct_L7_D3 = !lwe.new_lwe_ciphertext<application_data = <message_type = i16>, plaintext_space = <ring = #ring_Z65537_i64_1_x1024, encoding = #full_crt_packing_encoding>, ciphertext_space = #ciphertext_space_L7_D3, key = #key, modulus_chain = #modulus_chain_L7_C7>
module attributes {backend.openfhe, scheme.bfv} {
  func.func private @__heir_debug_1(!cc, !sk, !ct_L7_D3)
  func.func private @__heir_debug_0(!cc, !sk, !ct_L7)
  func.func @mult_dep(%cc: !cc, %sk: !sk, %ct: !ct_L7) -> !ct_L7 {
    call @__heir_debug_0(%cc, %sk, %ct) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_0 = openfhe.mul_no_relin %cc, %ct, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_0) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_1 = openfhe.relin %cc, %ct_0 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_1) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_2 = openfhe.mul_no_relin %cc, %ct_1, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_2) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_3 = openfhe.relin %cc, %ct_2 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_3) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_4 = openfhe.mul_no_relin %cc, %ct_3, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_4) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_5 = openfhe.relin %cc, %ct_4 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_5) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_6 = openfhe.mul_no_relin %cc, %ct_5, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_6) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_7 = openfhe.relin %cc, %ct_6 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_7) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_8 = openfhe.mul_no_relin %cc, %ct_7, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_8) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_9 = openfhe.relin %cc, %ct_8 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_9) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_10 = openfhe.mul_no_relin %cc, %ct_9, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_10) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_11 = openfhe.relin %cc, %ct_10 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_11) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_12 = openfhe.mul_no_relin %cc, %ct_11, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_12) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_13 = openfhe.relin %cc, %ct_12 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_13) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_14 = openfhe.mul_no_relin %cc, %ct_13, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_14) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_15 = openfhe.relin %cc, %ct_14 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_15) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_16 = openfhe.mul_no_relin %cc, %ct_15, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_16) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_17 = openfhe.relin %cc, %ct_16 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_17) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_18 = openfhe.mul_no_relin %cc, %ct_17, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_18) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_19 = openfhe.relin %cc, %ct_18 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_19) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_20 = openfhe.mul_no_relin %cc, %ct_19, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_20) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_21 = openfhe.relin %cc, %ct_20 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_21) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_22 = openfhe.mul_no_relin %cc, %ct_21, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_22) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_23 = openfhe.relin %cc, %ct_22 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_23) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_24 = openfhe.mul_no_relin %cc, %ct_23, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_24) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_25 = openfhe.relin %cc, %ct_24 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_25) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_26 = openfhe.mul_no_relin %cc, %ct_25, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_26) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_27 = openfhe.relin %cc, %ct_26 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_27) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_28 = openfhe.mul_no_relin %cc, %ct_27, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_28) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_29 = openfhe.relin %cc, %ct_28 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_29) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_30 = openfhe.mul_no_relin %cc, %ct_29, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_30) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_31 = openfhe.relin %cc, %ct_30 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_31) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_32 = openfhe.mul_no_relin %cc, %ct_31, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_32) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_33 = openfhe.relin %cc, %ct_32 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_33) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_34 = openfhe.mul_no_relin %cc, %ct_33, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_34) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_35 = openfhe.relin %cc, %ct_34 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_35) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_36 = openfhe.mul_no_relin %cc, %ct_35, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_36) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_37 = openfhe.relin %cc, %ct_36 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_37) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_38 = openfhe.mul_no_relin %cc, %ct_37, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_38) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_39 = openfhe.relin %cc, %ct_38 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_39) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_40 = openfhe.mul_no_relin %cc, %ct_39, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_40) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_41 = openfhe.relin %cc, %ct_40 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_41) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_42 = openfhe.mul_no_relin %cc, %ct_41, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_42) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_43 = openfhe.relin %cc, %ct_42 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_43) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_44 = openfhe.mul_no_relin %cc, %ct_43, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_44) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_45 = openfhe.relin %cc, %ct_44 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_45) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_46 = openfhe.mul_no_relin %cc, %ct_45, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_46) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_47 = openfhe.relin %cc, %ct_46 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_47) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_48 = openfhe.mul_no_relin %cc, %ct_47, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_48) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_49 = openfhe.relin %cc, %ct_48 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_49) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_50 = openfhe.mul_no_relin %cc, %ct_49, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_50) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_51 = openfhe.relin %cc, %ct_50 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_51) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_52 = openfhe.mul_no_relin %cc, %ct_51, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_52) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_53 = openfhe.relin %cc, %ct_52 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_53) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_54 = openfhe.mul_no_relin %cc, %ct_53, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_54) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_55 = openfhe.relin %cc, %ct_54 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_55) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_56 = openfhe.mul_no_relin %cc, %ct_55, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_56) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_57 = openfhe.relin %cc, %ct_56 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_57) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_58 = openfhe.mul_no_relin %cc, %ct_57, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_58) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_59 = openfhe.relin %cc, %ct_58 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_59) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_60 = openfhe.mul_no_relin %cc, %ct_59, %ct : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_60) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_61 = openfhe.relin %cc, %ct_60 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_61) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    return %ct_61 : !ct_L7
  }
  func.func @mult_dep__encrypt__arg0(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_dep__decrypt__result0(%cc: !cc, %ct: !ct_L7, %sk: !sk) -> i16 {
    %pt = openfhe.decrypt %cc, %ct, %sk : (!cc, !ct_L7, !sk) -> !pt
    %0 = lwe.rlwe_decode %pt {encoding = #full_crt_packing_encoding, ring = #ring_Z65537_i64_1_x1024} : !pt -> i16
    return %0 : i16
  }
  func.func @mult_dep__generate_crypto_context() -> !cc {
    %params = openfhe.gen_params  {insecure = true, mulDepth = 32 : i64, plainMod = 65537 : i64, ringDim = 32768 : i64, scalingModSize = 60 : i64} : () -> !params
    %cc = openfhe.gen_context %params {supportFHE = false} : (!params) -> !cc
    return %cc : !cc
  }
  func.func @mult_dep__configure_crypto_context(%cc: !cc, %sk: !sk) -> !cc {
    openfhe.gen_mulkey %cc, %sk : (!cc, !sk) -> ()
    return %cc : !cc
  }
}

