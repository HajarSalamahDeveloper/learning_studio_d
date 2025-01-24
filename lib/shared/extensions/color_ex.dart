import 'package:flutter/rendering.dart';

/// Extension on [Color] to provide additional functionality for color manipulation.
extension ColorEx on Color {
  
  /// Converts the color to a hexadecimal string representation.
  ///
  /// [leadingHashSign] determines whether to include a leading '#' in the hex string. Default is true.
  ///
  /// [includeAlpha] determines whether to include the alpha channel in the hex string. Default is false.
  ///
  /// Example usage:
  /// ```dart
  /// Color(0xFF00FF).toHex(); // '#FF00FF'
  /// Color(0xFFFFA500).toHex(includeAlpha: true); // '#FFFFA500'
  /// ```
  String toHex({bool leadingHashSign = true, bool includeAlpha = false}) =>
    '${leadingHashSign ? '#' : ''}'
    '${includeAlpha ? alpha.toRadixString(16).padLeft(2, '0') : ''}'
    '${red.toRadixString(16).padLeft(2, '0')}'
    '${green.toRadixString(16).padLeft(2, '0')}'
    '${blue.toRadixString(16).padLeft(2, '0')}';

  /// Determines if the color is dark based on its brightness.
  ///
  /// Returns true if the color is dark, false otherwise.
  ///
  /// Example usage:
  /// ```dart
  /// Color(0xFF000000).isDark(); // true
  /// Color(0xFFFFFFFF).isDark(); // false
  /// ```
  bool isDark() => _getBrightness() < 128.0;

  /// Determines if the color is light based on its brightness.
  ///
  /// Returns true if the color is light, false otherwise.
  ///
  /// Example usage:
  /// ```dart
  /// Color(0xFF000000).isLight(); // false
  /// Color(0xFFFFFFFF).isLight(); // true
  /// ```
  bool isLight() => !isDark();

  /// Calculates the brightness of the color.
  ///
  /// Returns a double value representing the brightness of the color.
  double _getBrightness() => (red * 299 + green * 587 + blue * 114) / 1000;
}
