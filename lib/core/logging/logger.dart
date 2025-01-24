import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

/// Enum to define the type of log messages.
enum LogType { log, error, route, debug, success, notification }

/// A logger utility class for printing colored log messages in the console.
/// The class uses ANSI color codes to differentiate between various types of logs
/// (e.g., error, route, debug) when running in debug mode.
///
/// The logs are printed using the `dart:developer` log function, and colors are applied
/// to make the logs visually distinct in the terminal.
class Logger {
  Logger(dynamic data, [LogType type = LogType.log]) {
    _log(data, type);
  }

  /// Logs a message to the console with an optional log type that affects
  /// the message format and color.
  static void _log(dynamic data, [LogType type = LogType.log]) {
    if (kDebugMode) {
      final color = _getLogColor(type);
      final message = _formatMessage(data.toString(), type);
      dev.log('$color$message$_resetColor');
    }
  }

  /// Logs an error message to the console.
  static void error(dynamic data) => _log(data, LogType.error);

  /// Logs a route message to the console.
  static void route(dynamic data) => _log(data, LogType.route);

  /// Logs a debug message to the console.
  static void debug(dynamic data) => _log(data, LogType.debug);

  /// Logs an info message to the console.
  static void success(dynamic data) => _log(data, LogType.success);

  /// Logs a notification message to the console.
  static void notification(dynamic data) => _log(data, LogType.notification);

  /// Returns the corresponding ANSI color code for the given [LogType].
  static String _getLogColor(LogType type) {
    switch (type) {
      case LogType.error:
        return '\x1B[31m'; // Red
      case LogType.route:
        return '\x1B[34m'; // Blue
      case LogType.debug:
        return '\x1B[35m'; // Magenta
      case LogType.success:
        return '\x1B[32m'; // Green
      case LogType.notification:
        return '\x1B[36m'; // Cyan
      case LogType.log:
      default:
        return '\x1B[33m'; // Yellow
    }
  }

  /// Formats the log message by decoding any URL-encoded data and appending
  /// the log type in uppercase.
  static String _formatMessage(String data, LogType type) {
    // final decodedData = Uri.decodeComponent(data);
    return '[${type.name.toUpperCase()}]: $data';
  }

  /// ANSI escape code to reset the color back to the default console color.
  static const _resetColor = '\x1B[0m';
}
