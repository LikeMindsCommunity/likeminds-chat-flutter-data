import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';

// Define the maximum retries allowed
const int MAX_RETRIES_ALLOWED = 3;

class RetryInterceptor extends Interceptor {
  final ApiManager apiManager;
  LMChatSDKCallback? callback;

  RetryInterceptor({
    required this.apiManager,
    this.callback,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Check if the error type is response-related
    if (_shouldRetry(err) && _isRetryable(err)) {
      // Get the number of retry attempts from the request extra field
      var retryCount = err.requestOptions.extra["retryCount"] ?? 0;

      if (retryCount < MAX_RETRIES_ALLOWED) {
        retryCount++;
        // Calculate retry delay with exponential backoff strategy
        final retryDelay = Duration(seconds: 1 << (retryCount - 1));

        // Log the retry attempt and delay
        debugPrint(
            'Retrying request: Attempt $retryCount \n with delay: ${retryDelay.inSeconds} seconds.');

        // Wait for the retry delay before retrying the request
        await Future.delayed(retryDelay);

        // Update retry count in the request options
        err.requestOptions.extra["retryCount"] = retryCount;

        try {
          // Retry the request with the updated options
          final response = await apiManager.client().fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.reject(e as DioException);
        }
      }
    }

    // If retries exhausted or not retryable, reject with error
    return handler.next(err);
  }

  // Determine if we should retry based on HTTP status codes
  bool _isRetryable(DioException err) {
    if (err.type == DioExceptionType.badResponse && err.response != null) {
      final statusCode = err.response!.statusCode;
      return [
        500, // Internal Server Error
        502, // Bad Gateway
        503, // Service Unavailable
        504, // Gateway Timeout
        408, // Request Timeout
        429 // Too Many Requests
      ].contains(statusCode);
    }
    return false;
  }

  // Optional: Extend logic to check other failure conditions, like network errors
  bool _shouldRetry(DioException err) {
    return err.type != DioExceptionType.cancel &&
        err.type != DioExceptionType.connectionTimeout &&
        err.type != DioExceptionType.connectionError;
  }
}
