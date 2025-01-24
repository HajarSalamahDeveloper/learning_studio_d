extension IntEx on int {
  bool get isEven => this % 2 == 0;
  bool get isOdd => this % 2 != 0;

  bool get isNegative => this < 0;
  bool get isPositive => this > 0;

  bool get isZero => this == 0;

  
  
}
