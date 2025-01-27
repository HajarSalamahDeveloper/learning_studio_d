import 'package:learning_studio/core/logging/logger.dart';
import 'api_exception.dart';

/// A generic class to represent the result of an operation, 
/// which can either be a success containing data or a failure containing an error.
class Result<T> {
  /// The data returned in case of success.
  final T? data;

  /// The error returned in case of failure.
  final ApiException? error;

  /// Creates a [Result] instance.
  /// 
  /// Either [data] or [error] should be provided, but not both.
  Result({this.data, this.error});

  /// Factory constructor to create a success [Result] with the provided [data].
  factory Result.success(T data) => Result(data: data);

  /// Factory constructor to create a failure [Result] with the provided [error].
  /// 
  /// Logs the [error] using the [Logger].
  factory Result.failure(ApiException error) {
    Logger.error(error);
    return Result(error: error);
  }

  /// Returns `true` if the result is a success, i.e., it contains [data].
  bool get isSuccess => data != null;

  /// Returns `true` if the result is a failure, i.e., it contains [error].
  bool get isFailure => error != null;

  /// Folds the [Result] into a single value by applying either [onSuccess] or [onFailure].
  /// 
  /// - [onSuccess] is called with the [data] if the result is a success.
  /// - [onFailure] is called with the [error] if the result is a failure.
  /// 
  /// Returns the value returned by the corresponding function.
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(ApiException error) onFailure,
  }) {
    if (isSuccess) {
      return onSuccess(data as T);
    } else {
      return onFailure(error!);
    }
  }

  @override
  String toString() {
    if (isSuccess) {
      return 'Success: $data';
    } else {
      return 'Failure: ${error?.toString()}';
    }
  }
}

/// Represents a success result containing [data].
/// 
/// This is a specialized subclass of [Result].
class Success<T> extends Result {
  /// Creates a [Success] instance with the given [data].
  Success(T data) : super(data: data);
}

/// Represents a failure result containing an [ApiException].
/// 
/// This is a specialized subclass of [Result].
class Failure<T> extends Result {
  /// Creates a [Failure] instance with the given [error].
  Failure(ApiException error) : super(error: error);
}
