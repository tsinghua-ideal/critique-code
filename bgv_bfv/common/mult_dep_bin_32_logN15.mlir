module {
  func.func @mult_dep(%0: i16 {secret.secret}) -> i16 {
    %1 = arith.muli %0, %0 : i16
    %2 = arith.muli %1, %1 : i16
    %3 = arith.muli %2, %2 : i16
    %4 = arith.muli %3, %3 : i16
    %5 = arith.muli %4, %4 : i16
    %6 = arith.muli %5, %5 : i16
    %7 = arith.muli %6, %6 : i16
    %8 = arith.muli %7, %7 : i16
    %9 = arith.muli %8, %8 : i16
    %10 = arith.muli %9, %9 : i16
    %11 = arith.muli %10, %10 : i16
    %12 = arith.muli %11, %11 : i16
    %13 = arith.muli %12, %12 : i16
    %14 = arith.muli %13, %13 : i16
    %15 = arith.muli %14, %14 : i16
    %16 = arith.muli %15, %15 : i16
    %17 = arith.muli %16, %16 : i16
    %18 = arith.muli %17, %17 : i16
    %19 = arith.muli %18, %18 : i16
    %20 = arith.muli %19, %19 : i16
    %21 = arith.muli %20, %20 : i16
    %22 = arith.muli %21, %21 : i16
    %23 = arith.muli %22, %22 : i16
    %24 = arith.muli %23, %23 : i16
    %25 = arith.muli %24, %24 : i16
    %26 = arith.muli %25, %25 : i16
    %27 = arith.muli %26, %26 : i16
    %28 = arith.muli %27, %27 : i16
    %29 = arith.muli %28, %28 : i16
    %30 = arith.muli %29, %29 : i16
    %31 = arith.muli %30, %30 : i16
    return %31 : i16
  }
}
