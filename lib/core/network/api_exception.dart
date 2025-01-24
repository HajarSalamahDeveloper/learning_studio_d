import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

/// Enum representing various error messages for different types of failures.
///
/// Each error message corresponds to a common error type that may occur during
/// HTTP requests, such as timeouts or connection issues.
enum ErrorMessage {
  /// Connection timed out while trying to establish a connection.
  connectionTimeout('connectionTimeout'),

  /// Timeout occurred while sending data.
  sendTimeout('sendTimeout'),

  /// Timeout occurred while receiving data.
  receiveTimeout('receiveTimeout'),

  /// The request was canceled by the user or the system.
  requestCanceled('requestCanceled'),

  /// No internet connection available.
  noInternet('noInternet'),

  /// An unknown error occurred.
  unknown('unknown'),

  /// An unexpected error occurred that doesn't fit into other categories.
  unexpected('unexpected');

  /// Human-readable error message corresponding to the error.
  final String message;

  /// Constructor for [ErrorMessage] enum that assigns a specific error message.
  const ErrorMessage(this.message);
}

/// A custom exception class used for handling API-related errors.
///
/// The [ApiException] class wraps around errors that occur during HTTP requests
/// and provides specific error messages based on the error type and status code.
class ApiException implements Exception {
  /// The error message explaining the nature of the error.
  final String? message;

  /// The HTTP status code received from the server, if applicable.
  final int? statusCode;

  /// Constructor for [ApiException] that allows setting an optional error [message]
  /// and [statusCode].
  ApiException({this.message = 'error', this.statusCode});

  /// Factory method that handles the conversion of dynamic errors into [ApiException] instances.
  ///
  /// This method inspects the type of [error] and converts it into an appropriate [ApiException].
  /// Handles Dio-specific errors and also handles network errors like [SocketException].
  ///
  /// Example usage:
  /// ```dart
  /// try {
  ///   await dio.get('/some-endpoint');
  /// } catch (e) {
  ///   throw ApiException.handleError(e);
  /// }
  /// ```
  static ApiException handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error); // Handle Dio-specific errors
    } else if (error is SocketException) {
      return ApiException(
        statusCode: 503, //Service Unavailable
        message: ErrorMessage.noInternet.message, // Handle no internet errors
      );
    }
    // Catch all other errors as unknown
    else {
      return ApiException(message: ErrorMessage.unknown.message);
    }
  }

  /// Private method to handle Dio-specific exceptions.
  ///
  /// It inspects the [DioException] type and converts it into an [ApiException]
  /// with an appropriate error message. It also tries to extract the HTTP status code
  /// from the Dio response, if available.
  static ApiException _handleDioException(DioException error) {
    final statusCode = error.response?.statusCode; // Extract status code if available

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(
          message: ErrorMessage.connectionTimeout.message,
          statusCode: 503,
        );
      case DioExceptionType.sendTimeout:
        return ApiException(
          message: ErrorMessage.sendTimeout.message,
          statusCode: statusCode,
        );
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: ErrorMessage.receiveTimeout.message,
          statusCode: statusCode,
        );
      case DioExceptionType.badResponse:
        return ApiException(
          message: _handleStatusCode(statusCode, error: error), // Handle status code based errors
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return ApiException(
          message: ErrorMessage.requestCanceled.message,
          statusCode: statusCode,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: ErrorMessage.noInternet.message,
          statusCode: 503, //Service Unavailable
        );
      case DioExceptionType.unknown:
      default:
        return ApiException(
          message: ErrorMessage.unexpected.message,
          statusCode: statusCode,
        );
    }
  }

  /// A helper method to convert HTTP status codes into user-friendly messages.
  ///
  /// It maps common status codes (e.g., 400, 401, 500) to readable messages. If
  /// the status code is not recognized, it returns a default error message.
  static String _handleStatusCode(int? statusCode, {DioException? error}) {
    final statusMessages = {
      400: tr('badRequest'),
      401: tr('unauthorized'),
      403: tr('forbidden'),
      404: tr('notFound'),
      500: tr('internalServerError'),
      422: _getAllErrorMessages(error?.response),
    };

    // Return a friendly message or a default if the status code is unknown
    return statusMessages[statusCode] ?? tr('invalid_status_code',namedArgs: {
      'code':'$statusCode'
    }) ;
  }

  static String _getAllErrorMessages(dynamic e) {
    try {
      final responseData = (e as Response).data;

      // Extract the `errors` object
      final errors = responseData['errors'];

      if (errors is Map<String, dynamic>) {
        final errorMessages = errors.values.expand((fieldErrors) {
          if (fieldErrors is List) {
            return fieldErrors.map((error) => '$error');
          } else {
            return [fieldErrors.toString()];
          }
        }).join(', '); // Join all error messages with a comma and a space

        return errorMessages;
      }

      // If the `errors` field is missing, fallback to the `message` field
      if (responseData['message'] is String) {
        return responseData['message'];
      }

      return 'unknown'.tr();
    } catch (_) {
      return 'error_parsing_error_response'.tr();
    }
  }

  /// Overrides the [toString] method to provide a detailed error message.
  ///
  /// This message includes both the error [message] and the [statusCode], if available.
  @override
  String toString() => 'Error: $message${statusCode != null ? ' (Status code: $statusCode)' : ''}';
}
