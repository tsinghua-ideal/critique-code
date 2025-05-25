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
  func.func @mult_indep(%cc: !cc, %sk: !sk, %ct: !ct_L7, %ct_0: !ct_L7, %ct_1: !ct_L7, %ct_2: !ct_L7, %ct_3: !ct_L7, %ct_4: !ct_L7, %ct_5: !ct_L7, %ct_6: !ct_L7, %ct_7: !ct_L7, %ct_8: !ct_L7, %ct_9: !ct_L7, %ct_10: !ct_L7, %ct_11: !ct_L7, %ct_12: !ct_L7, %ct_13: !ct_L7, %ct_14: !ct_L7, %ct_15: !ct_L7, %ct_16: !ct_L7, %ct_17: !ct_L7, %ct_18: !ct_L7, %ct_19: !ct_L7, %ct_20: !ct_L7, %ct_21: !ct_L7, %ct_22: !ct_L7, %ct_23: !ct_L7, %ct_24: !ct_L7, %ct_25: !ct_L7, %ct_26: !ct_L7, %ct_27: !ct_L7, %ct_28: !ct_L7, %ct_29: !ct_L7, %ct_30: !ct_L7) -> !ct_L7 {
    call @__heir_debug_0(%cc, %sk, %ct) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_0) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_1) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_2) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_3) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_4) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_5) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_6) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_7) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_8) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_9) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_10) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_11) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_12) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_13) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_14) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_15) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_16) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_17) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_18) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_19) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_20) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_21) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_22) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_23) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_24) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_25) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_26) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_27) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_28) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_29) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    call @__heir_debug_0(%cc, %sk, %ct_30) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_31 = openfhe.mul_no_relin %cc, %ct, %ct_0 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_31) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_32 = openfhe.relin %cc, %ct_31 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_32) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_33 = openfhe.mul_no_relin %cc, %ct_32, %ct_1 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_33) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_34 = openfhe.relin %cc, %ct_33 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_34) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_35 = openfhe.mul_no_relin %cc, %ct_34, %ct_2 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_35) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_36 = openfhe.relin %cc, %ct_35 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_36) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_37 = openfhe.mul_no_relin %cc, %ct_36, %ct_3 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_37) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_38 = openfhe.relin %cc, %ct_37 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_38) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_39 = openfhe.mul_no_relin %cc, %ct_38, %ct_4 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_39) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_40 = openfhe.relin %cc, %ct_39 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_40) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_41 = openfhe.mul_no_relin %cc, %ct_40, %ct_5 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_41) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_42 = openfhe.relin %cc, %ct_41 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_42) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_43 = openfhe.mul_no_relin %cc, %ct_42, %ct_6 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_43) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_44 = openfhe.relin %cc, %ct_43 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_44) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_45 = openfhe.mul_no_relin %cc, %ct_44, %ct_7 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_45) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_46 = openfhe.relin %cc, %ct_45 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_46) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_47 = openfhe.mul_no_relin %cc, %ct_46, %ct_8 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_47) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_48 = openfhe.relin %cc, %ct_47 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_48) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_49 = openfhe.mul_no_relin %cc, %ct_48, %ct_9 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_49) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_50 = openfhe.relin %cc, %ct_49 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_50) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_51 = openfhe.mul_no_relin %cc, %ct_50, %ct_10 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_51) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_52 = openfhe.relin %cc, %ct_51 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_52) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_53 = openfhe.mul_no_relin %cc, %ct_52, %ct_11 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_53) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_54 = openfhe.relin %cc, %ct_53 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_54) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_55 = openfhe.mul_no_relin %cc, %ct_54, %ct_12 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_55) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_56 = openfhe.relin %cc, %ct_55 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_56) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_57 = openfhe.mul_no_relin %cc, %ct_56, %ct_13 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_57) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_58 = openfhe.relin %cc, %ct_57 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_58) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_59 = openfhe.mul_no_relin %cc, %ct_58, %ct_14 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_59) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_60 = openfhe.relin %cc, %ct_59 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_60) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_61 = openfhe.mul_no_relin %cc, %ct_60, %ct_15 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_61) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_62 = openfhe.relin %cc, %ct_61 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_62) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_63 = openfhe.mul_no_relin %cc, %ct_62, %ct_16 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_63) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_64 = openfhe.relin %cc, %ct_63 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_64) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_65 = openfhe.mul_no_relin %cc, %ct_64, %ct_17 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_65) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_66 = openfhe.relin %cc, %ct_65 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_66) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_67 = openfhe.mul_no_relin %cc, %ct_66, %ct_18 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_67) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_68 = openfhe.relin %cc, %ct_67 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_68) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_69 = openfhe.mul_no_relin %cc, %ct_68, %ct_19 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_69) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_70 = openfhe.relin %cc, %ct_69 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_70) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_71 = openfhe.mul_no_relin %cc, %ct_70, %ct_20 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_71) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_72 = openfhe.relin %cc, %ct_71 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_72) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_73 = openfhe.mul_no_relin %cc, %ct_72, %ct_21 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_73) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_74 = openfhe.relin %cc, %ct_73 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_74) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_75 = openfhe.mul_no_relin %cc, %ct_74, %ct_22 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_75) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_76 = openfhe.relin %cc, %ct_75 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_76) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_77 = openfhe.mul_no_relin %cc, %ct_76, %ct_23 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_77) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_78 = openfhe.relin %cc, %ct_77 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_78) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_79 = openfhe.mul_no_relin %cc, %ct_78, %ct_24 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_79) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_80 = openfhe.relin %cc, %ct_79 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_80) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_81 = openfhe.mul_no_relin %cc, %ct_80, %ct_25 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_81) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_82 = openfhe.relin %cc, %ct_81 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_82) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_83 = openfhe.mul_no_relin %cc, %ct_82, %ct_26 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_83) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_84 = openfhe.relin %cc, %ct_83 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_84) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_85 = openfhe.mul_no_relin %cc, %ct_84, %ct_27 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_85) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_86 = openfhe.relin %cc, %ct_85 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_86) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_87 = openfhe.mul_no_relin %cc, %ct_86, %ct_28 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_87) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_88 = openfhe.relin %cc, %ct_87 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_88) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_89 = openfhe.mul_no_relin %cc, %ct_88, %ct_29 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_89) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_90 = openfhe.relin %cc, %ct_89 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_90) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    %ct_91 = openfhe.mul_no_relin %cc, %ct_90, %ct_30 : (!cc, !ct_L7, !ct_L7) -> !ct_L7_D3
    call @__heir_debug_1(%cc, %sk, %ct_91) {message.size = "1"} : (!cc, !sk, !ct_L7_D3) -> ()
    %ct_92 = openfhe.relin %cc, %ct_91 : (!cc, !ct_L7_D3) -> !ct_L7
    call @__heir_debug_0(%cc, %sk, %ct_92) {message.size = "1"} : (!cc, !sk, !ct_L7) -> ()
    return %ct_92 : !ct_L7
  }
  func.func @mult_indep__encrypt__arg0(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg1(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg2(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg3(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg4(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg5(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg6(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg7(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg8(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg9(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg10(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg11(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg12(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg13(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg14(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg15(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg16(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg17(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg18(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg19(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg20(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg21(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg22(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg23(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg24(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg25(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg26(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg27(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg28(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg29(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg30(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__encrypt__arg31(%cc: !cc, %arg0: i16, %pk: !pk) -> !ct_L7 {
    %splat = tensor.splat %arg0 : tensor<1024xi16>
    %0 = arith.extsi %splat : tensor<1024xi16> to tensor<1024xi64>
    %pt = openfhe.make_packed_plaintext %cc, %0 : (!cc, tensor<1024xi64>) -> !pt
    %ct = openfhe.encrypt %cc, %pt, %pk : (!cc, !pt, !pk) -> !ct_L7
    return %ct : !ct_L7
  }
  func.func @mult_indep__decrypt__result0(%cc: !cc, %ct: !ct_L7, %sk: !sk) -> i16 {
    %pt = openfhe.decrypt %cc, %ct, %sk : (!cc, !ct_L7, !sk) -> !pt
    %0 = lwe.rlwe_decode %pt {encoding = #full_crt_packing_encoding, ring = #ring_Z65537_i64_1_x1024} : !pt -> i16
    return %0 : i16
  }
  func.func @mult_indep__generate_crypto_context() -> !cc {
    %params = openfhe.gen_params  {insecure = true, mulDepth = 32 : i64, plainMod = 65537 : i64, ringDim = 32768 : i64, scalingModSize = 60 : i64} : () -> !params
    %cc = openfhe.gen_context %params {supportFHE = false} : (!params) -> !cc
    return %cc : !cc
  }
  func.func @mult_indep__configure_crypto_context(%cc: !cc, %sk: !sk) -> !cc {
    openfhe.gen_mulkey %cc, %sk : (!cc, !sk) -> ()
    return %cc : !cc
  }
}

