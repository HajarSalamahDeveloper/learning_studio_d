import 'package:dio/dio.dart';
import 'package:learning_studio/config/localizaion/localization_service.dart';
import 'package:learning_studio/core/di/locator.dart';
import 'package:learning_studio/core/logging/logger.dart';
import 'package:learning_studio/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:learning_studio/shared/models/user_model.dart';

import 'api_endpoints.dart';
import 'api_exception.dart';
import 'result.dart';

/// A client class that wraps the Dio package for making HTTP requests.
/// This class provides `GET` and `POST` methods to interact with a RESTful API.
/// It handles API responses and errors gracefully, returning a `Result` object
/// that indicates success or failure.
///
/// The DioClient class can be used for fetching data from an API using the `GET` method
/// or sending data with the `POST` method. Additionally, it handles request and response
/// logging using interceptors.
class DioClient {
  /// Instance of Dio used to perform HTTP requests.
  late Dio _dio;

  /// Initializes the Dio client with default options such as base URL,
  /// request timeouts, and default headers.
  ///
  /// This constructor configures the Dio client to use interceptors for logging
  /// requests and responses. The interceptors can also handle request failures.
  DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl, // Sets the base URL for the API.
      connectTimeout: const Duration(seconds: 10), // Timeout for connection.
      receiveTimeout:
          const Duration(seconds: 10), // Timeout for receiving a response.
      headers: {
        'Authorization': 'Bearer ${UserModel.cache()?.token}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio = Dio(options);

    // Add interceptors for logging requests and handling errors.
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Dynamically fetch the latest token
        final token = UserModel.cache()?.token;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['X-Language'] =
            sl<LocalizationService>().currentLocale.languageCode;

        Logger.route('[${options.method}] ${options.uri.toString()}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response); // Continue with the response
      },
      onError: (error, handler) {
        // Logout if token is expired
        if (error.response?.statusCode == 401) {
          sl<LoginCubit>().logout();
        }
        return handler.next(error); // Handle the error
      },
    ));
  }

  /// Performs a `GET` request to the given [endpoint].
  ///
  /// - [endpoint]: The API endpoint to send the request to.
  /// - [queryParameters]: Optional query parameters to include in the request.
  ///
  /// Returns a [Result] object which either contains the response data
  /// on success, or an error message on failure.
  ///
  /// Example:
  /// ```dart
  /// var result = await dioClient.get('/users', queryParameters: {'page': 1});
  /// ```
  Future<Result> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return Result.success(response.data); // Return success with data
    } catch (e) {
      return Result.failure(
          ApiException.handleError(e)); // Return failure with error
    }
  }

  /// Mock function to simulate a network request
  /// - [fakeData]: The fake data to return
  /// Duration: The duration to simulate network latency
  /// Returns a [Result] object which either contains the response data
  /// on success, or an error message on failure
  Future<Result> mockGet(Object fakeData,{Duration duration = const Duration(seconds: 1)}) async {
    try {
      // Simulate network latency
      await Future.delayed(duration);
      return Result.success(fakeData);
    } catch (e) {
      return Result.failure(ApiException.handleError(e));
    }
  }

  /// Performs a `POST` request to the given [endpoint].
  ///
  /// - [endpoint]: The API endpoint to send the request to.
  /// - [data]: Optional data to be included in the request body.
  /// - [queryParameters]: Optional query parameters to include in the request.
  ///
  /// Returns a [Result] object which either contains the response data
  /// on success, or an error message on failure.
  ///
  /// Example:
  /// ```dart
  /// var result = await dioClient.post('/login', data: {'username': 'user', 'password': 'pass'});
  /// ```
  Future<Result> post(String endpoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return Result.success(response.data); // Return success with data
    } catch (e) {
      return Result.failure(
          ApiException.handleError(e)); // Return failure with error
    }
  }

  /// performs a `PATCH` request to the given [endpoint].
  ///
  /// - [endpoint]: The API endpoint to send the request to.
  /// - [data]: Optional data to be included in the request body.
  /// - [queryParameters]: Optional query parameters to include in the request.
  ///
  /// Returns a [Result] object which either contains the response data
  /// on success, or an error message on failure.
  ///
  /// Example:
  /// ```dart
  /// var result = await dioClient.patch('/update', data: {'username': 'user', 'password': 'pass'});
  /// ```
  Future<Result> patch(String endpoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return Result.success(response.data); // Return success with data
    } catch (e) {
      return Result.failure(
          ApiException.handleError(e)); // Return failure with error
    }
  }

  /// performs a `DELETE` request to the given [endpoint].
  ///
  /// - [endpoint]: The API endpoint to send the request to.
  /// - [data]: Optional data to be included in the request body.
  /// - [queryParameters]: Optional query parameters to include in the request.
  ///
  /// Returns a [Result] object which either contains the response data
  /// on success, or an error message on failure.
  ///
  /// Example:
  /// ```dart
  /// var result = await dioClient.delete('/delete', data: {'username': 'user', 'password': 'pass'});
  /// ```
  Future<Result> delete(String endpoint,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      return Result.success(response.data); // Return success with data
    } catch (e) {
      return Result.failure(
          ApiException.handleError(e)); // Return failure with error
    }
  }
}
