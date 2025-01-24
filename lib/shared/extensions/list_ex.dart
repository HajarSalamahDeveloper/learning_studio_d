/// Extension on [List] to provide additional methods for list manipulation.
extension ListEx<T> on List<T> {
  
  /// Returns the first element that satisfies the condition specified by [test], or null if no such element is found.
  ///
  /// Example usage:
  /// ```dart
  /// List<int> numbers = [1, 2, 3, 4, 5];
  /// int? firstEven = numbers.firstWhereOrNull((element) => element % 2 == 0);
  /// print(firstEven); // Outputs: 2
  /// ```
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
