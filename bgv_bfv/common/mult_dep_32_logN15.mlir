module attributes {backend.openfhe, bgv.schemeParam = #bgv.scheme_param<logN = 15, Q = [35184372744193, 35184373006337, 35184373989377, 35184376545281, 35184377331713, 35184378511361, 35184378707969, 35184379035649], P = [35184380870657, 35184381591553, 35184381853697], plaintextModulus = 65537>, scheme.bgv} {
  func.func @mult_dep(%0: i16 {secret.secret}) -> i16 {
    %1 = arith.muli %0, %0 : i16
    %2 = arith.muli %1, %0 : i16
    %3 = arith.muli %2, %0 : i16
    %4 = arith.muli %3, %0 : i16
    %5 = arith.muli %4, %0 : i16
    %6 = arith.muli %5, %0 : i16
    %7 = arith.muli %6, %0 : i16
    %8 = arith.muli %7, %0 : i16
    %9 = arith.muli %8, %0 : i16
    %10 = arith.muli %9, %0 : i16
    %11 = arith.muli %10, %0 : i16
    %12 = arith.muli %11, %0 : i16
    %13 = arith.muli %12, %0 : i16
    %14 = arith.muli %13, %0 : i16
    %15 = arith.muli %14, %0 : i16
    %16 = arith.muli %15, %0 : i16
    %17 = arith.muli %16, %0 : i16
    %18 = arith.muli %17, %0 : i16
    %19 = arith.muli %18, %0 : i16
    %20 = arith.muli %19, %0 : i16
    %21 = arith.muli %20, %0 : i16
    %22 = arith.muli %21, %0 : i16
    %23 = arith.muli %22, %0 : i16
    %24 = arith.muli %23, %0 : i16
    %25 = arith.muli %24, %0 : i16
    %26 = arith.muli %25, %0 : i16
    %27 = arith.muli %26, %0 : i16
    %28 = arith.muli %27, %0 : i16
    %29 = arith.muli %28, %0 : i16
    %30 = arith.muli %29, %0 : i16
    %31 = arith.muli %30, %0 : i16
    return %31 : i16
  }
}
