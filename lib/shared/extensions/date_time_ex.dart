import 'package:learning_studio/config/localizaion/localization_service.dart';
import 'package:learning_studio/core/di/locator.dart';
import 'package:easy_localization/easy_localization.dart';

/// Extension on [DateTime] to provide a human-readable "time ago" functionality.
/// It returns the time difference between the current time and the provided timestamp,
/// formatted into a user-friendly string like "5 minutes ago" or "2 hours ago".
///
/// The position of "ago" changes based on the locale:
/// - In Arabic (`ar`), "ago" is placed at the beginning, e.g., "منذ 5 دقائق".
/// - In other languages, "ago" is placed at the end, e.g., "5 minutes ago".
extension DateTimeEx on DateTime {
  /// Returns a human-readable "time ago" string based on the time difference from the current time.
  /// Example: "5 minutes ago", "2 hours ago", etc.
  ///
  /// Uses [formatTime] to determine the appropriate time unit (seconds, minutes, hours, etc.)
  /// and handle localization based on the current language (using EasyLocalization).
  String get timeAgo => formatTime(millisecondsSinceEpoch);

  /// Formats the time difference between the current time and the given [timestamp] into
  /// a human-readable string.
  ///
  /// The result is based on the magnitude of the time difference:
  /// - Seconds, Minutes, Hours, Days, Weeks, Months, or Years.
  /// The "ago" placement changes based on the current language.
  ///
  /// [timestamp]: The timestamp to compare with the current time.
  /// Returns: A localized string representing how long ago the timestamp was.
  String formatTime(int timestamp) {
    // Calculate the difference between the current time and the timestamp
    int difference = DateTime.now().millisecondsSinceEpoch - timestamp;
    String result;

    // Determine the appropriate time unit to describe the time difference
    if (difference < 60000) {
      result = DateTimeHelper._countSeconds(difference);
    } else if (difference < 3600000) {
      result = DateTimeHelper._countMinutes(difference);
    } else if (difference < 86400000) {
      result = DateTimeHelper._countHours(difference);
    } else if (difference < 604800000) {
      result = DateTimeHelper._countDays(difference);
    } else if (difference / 1000 < 2419200) {
      result = DateTimeHelper._countWeeks(difference);
    } else if (difference / 1000 < 31536000) {
      result = DateTimeHelper._countMonths(difference);
    } else {
      result = DateTimeHelper._countYears(difference);
    }

    // Check if the current locale is Arabic
    final isArabic = sl<LocalizationService>().isAr;

    // Adjust the placement of "ago" based on the locale
    if (!result.startsWith(tr('just_now'))) {
      // If not "just now", place "ago" appropriately
      return isArabic ? '${tr('ago')} $result' : '$result ${tr('ago')}';
    } else {
      // If it's "just now", return it as-is
      return result;
    }
  }
}

/// [DateTimeHelper] contains static methods to calculate time units (seconds, minutes, hours, etc.)
/// from a given time difference in milliseconds and return the appropriate localized string.
///
/// This helper ensures that the main logic for converting time differences is modular and reusable.
class DateTimeHelper {
  DateTimeHelper._(); // Private constructor to prevent instantiation

  /// Returns the time difference in seconds, formatted as a localized string.
  /// - If the difference is more than 1 second, it returns "X seconds".
  /// - If less, it returns "just now".
  static String _countSeconds(int difference) {
    int count = (difference / 1000).truncate();
    return count > 1 ? tr('seconds', namedArgs: {'count': '$count'}) : tr('just_now');
  }

  /// Returns the time difference in minutes, formatted as a localized string.
  /// - If more than 1 minute, it returns "X minutes".
  /// - Otherwise, it returns "1 minute".
  static String _countMinutes(int difference) {
    int count = (difference / 60000).truncate();
    return count > 1 ? tr('minutes', namedArgs: {'count': '$count'}) : tr('minute');
  }

  /// Returns the time difference in hours, formatted as a localized string.
  /// - If more than 1 hour, it returns "X hours".
  /// - Otherwise, it returns "1 hour".
  static String _countHours(int difference) {
    int count = (difference / 3600000).truncate();
    return count > 1 ? tr('hours', namedArgs: {'count': '$count'}) : tr('hour');
  }

  /// Returns the time difference in days, formatted as a localized string.
  /// - If more than 1 day, it returns "X days".
  /// - Otherwise, it returns "1 day".
  static String _countDays(int difference) {
    int count = (difference / 86400000).truncate();
    return count > 1 ? tr('days', namedArgs: {'count': '$count'}) : tr('day');
  }

  /// Returns the time difference in weeks, formatted as a localized string.
  /// - If more than 1 week, it returns "X weeks".
  /// - Otherwise, it returns "1 week".
  static String _countWeeks(int difference) {
    int count = (difference / 604800000).truncate();
    return count > 1 ? tr('weeks', namedArgs: {'count': '$count'}) : tr('week');
  }

  /// Returns the time difference in months, formatted as a localized string.
  /// - If more than 1 month, it returns "X months".
  /// - Otherwise, it returns "1 month".
  static String _countMonths(int difference) {
    int count = (difference / 2628003000).round();
    return count > 1 ? tr('months', namedArgs: {'count': '$count'}) : tr('month');
  }

  /// Returns the time difference in years, formatted as a localized string.
  /// - If more than 1 year, it returns "X years".
  /// - Otherwise, it returns "1 year".
  static String _countYears(int difference) {
    int count = (difference / 31536000000).truncate();
    return count > 1 ? tr('years', namedArgs: {'count': '$count'}) : tr('year');
  }
}
