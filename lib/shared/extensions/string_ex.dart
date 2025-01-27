import 'package:learning_studio/core/utils/file_utils.dart';
import 'package:flutter/material.dart';

/// Extension on [String?] to provide additional utility methods for nullable strings.
extension NullableStringEx on String? {
  
  /// Returns true if the string is either null, empty, contains 'null', or consists only of whitespace.
  bool get isEmptyOrNull => this == null || (this != null && (this!.isEmpty || this!.toLowerCase() == 'null' || this!.trim().isEmpty));

  /// Converts a hex color string (e.g., '#RRGGBB' or 'RRGGBB') to a [Color].
  ///
  /// Returns [Colors.transparent] if the conversion fails.
  Color toColor() {
    try {
      final hexCode = this!.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    } catch (e) {
      return Colors.transparent;
    }
  }

  /// Converts a time string in 'HH:mm' format to 'h:mm AM/PM' format.
  ///
  /// Example: '14:30' converts to '2:30 PM'
  String toAmPm() {
    final hour = int.parse(this!.split(':')[0]);
    final minute = int.parse(this!.split(':')[1]);

    final amPm = hour < 12 ? 'AM' : 'PM';
    final formattedHour = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;

    return '$formattedHour:$minute $amPm';
  }

  /// Checks if the string is a valid URL for an image.
  bool isImageUrl() {
    if (this == null) return false;
    return this!.startsWith('http') || this!.startsWith('https') || FileUtils.imageExtensions.contains(this?.split('.').last);
  }
}

/// Extension on [String] to provide additional utility methods for strings.
extension StringEx on String {
  
  /// Converts the string to a double, optionally removing commas.
  ///
  /// [removeComma]: If true, removes commas before parsing.
  double toDouble({bool removeComma = true}) {
    String value = removeComma ? replaceAll(',', '') : this;
    return double.parse(value);
  }

  /// Converts the string to an integer, optionally removing commas.
  ///
  /// [removeComma]: If true, removes commas before parsing.
  int toInt({bool removeComma = true}) {
    String value = removeComma ? replaceAll(',', '') : this;
    return int.parse(value);
  }

  /// Returns true if the string contains at least one digit (0-9).
  bool get containsNumber {
    return RegExp(r'[0-9]').hasMatch(this);
  }

  /// Converts a time string in 'HH:mm' format to 'h:mm AM/PM' format.
  ///
  /// Example: '14:30' converts to '2:30 PM'
  String to12HourFormat() {
    final split = this.split(':');
    final hour = int.parse(split[0]);
    final minute = split[1];
    final amOrPm = hour < 12 ? 'AM' : 'PM';
    final formattedHour = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;

    return '$formattedHour:$minute $amOrPm';
  }

  /// Converts a time string in 'HH:mm' format to 'HH:mm' format (24-hour clock).
  ///
  /// Example: '2:30 PM' converts to '14:30'
  String to24HourFormat() {
    final split = this.split(':');
    final hour = int.parse(split[0]);
    final minute = split[1];
    final formattedHour = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;
    return '$formattedHour:$minute';
  }

  /// Converts Arabic numbers in the string to English numbers.
  ///
  /// Example: '١٢٣' converts to '123'
  String arToEnNumber(String text) {
    final arabicNumbers = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    final pattern = RegExp('[${arabicNumbers.keys.join()}]');
    return text.replaceAllMapped(pattern, (match) {
      final arabicNumber = match.group(0);
      return arabicNumbers[arabicNumber]!;
    });
  }

  /// Limits the string to a maximum length.
  ///
  /// [length]: Maximum length of the resulting string.
  String maxLength(int length) {
    if (length > this.length) {
      return this;
    } else {
      return substring(0, length);
    }
  }

  /// Converts the string to a boolean value.
  ///
  /// Returns true for '1' or 'true', false for '0' or 'false', or the specified [defaultValue] if conversion fails.
  bool toBool([bool defaultValue = false]) {
    if (toString().compareTo('1') == 0 || toString().compareTo('true') == 0) {
      return true;
    } else if (toString().compareTo('0') == 0 || toString().compareTo('false') == 0) {
      return false;
    }
    return defaultValue;
  }

  /// Checks if the string is a valid email address.
  bool get isEmail => _hasMatch(this,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Checks if the string contains only numeric digits (0-9).
  bool get isNumericOnly => _hasMatch(this, r'^\d+$');

  /// Checks if the string contains only Arabic characters.
  bool get isArabicOnly => _hasMatch(this, r'^[\u0600-\u06FF]+$');

  /// Checks if the string contains only English alphabetic characters.
  bool get isEnglishOnly => _hasMatch(this, r'^[a-zA-Z]+$');

  /// Extracts Arabic text from a mixed text containing Arabic and non-Arabic characters.
  String extractArabicText() {
    RegExp arabicRegExp = RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');
    return arabicRegExp.allMatches(this).map((match) => match.group(0)!).join();
  }

  /// Capitalizes the first letter of the string.
  String capitalizeFirst(String word) {
    return word.isNotEmpty ? word[0].toUpperCase() + word.substring(1).toLowerCase() : word;
  }

  /// Converts a number string to a format with thousands separator.
  ///
  /// Example: '1234567.89' converts to '1,234,567.89'
  String toThousandSeparated() {
    final number = double.tryParse(this);
    if (number == null) return this;

    return number.toStringAsFixed(number.truncateToDouble() == number ? 0 : 1).replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'), 
      (match) => ','
    );
  }

  /// Checks if the string starts with a valid callable phone prefix.
  ///
  /// Returns true if the string starts with '77', '78', '71', '70', or '73'.
  bool startsWithValidCallablePhonePrefix() {
    final validPrefixes = ['77', '78', '71', '70','73'];
    return validPrefixes.any((prefix) => startsWith(prefix));
  }

  /// Checks if the string starts with a valid phone prefix.
  ///
  /// Returns true if the string starts with '77', '78', '71', '70', '10', '01', or '73'.
  bool startsWithValidPhonePrefix() {
    final validPrefixes = ['77', '78', '71', '70','10','01','73'];
    return validPrefixes.any((prefix) => startsWith(prefix));
  }

  /// Checks if the string contains only digits.
  ///
  /// Returns true if the string can be parsed as an integer.
  bool containsOnlyDigits() {
    return int.tryParse(this) != null;
  }

  /// Helper method to check if [value] matches [pattern].
  bool _hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
