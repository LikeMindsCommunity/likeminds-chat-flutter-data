import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/endpoints.dart';
import 'package:likeminds_chat_fl/src/environment/env.dart';
import 'package:likeminds_chat_fl/src/managers/api/interceptors/common_header_interceptor.dart';
import 'package:likeminds_chat_fl/src/managers/api/interceptors/log_interceptor.dart';
import 'package:likeminds_chat_fl/src/managers/token_manager.dart';

import 'interceptors/token_interceptor.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class ApiManager {
  final TokenManager tokenManager;
  final bool production;

  ApiManager({
    required this.tokenManager,
    required this.production,
  }) {
    endPoints = EndPoints.instance(production);
    _init();
  }

  late final EndPoints endPoints;
  final Dio _dio = Dio();

  _init() async {
    Map<String, dynamic> headers = {
      "x-platform-code": EnvDev.platformCode,
      "x-version-code": EnvDev.versionCode,
      "x-sdk-source": "chat",
    };

    BaseOptions options = BaseOptions(headers: headers);
    _dio.options = options;
    _dio.interceptors.add(Logging());
    _dio.interceptors.add(CommonHeaderInterceptor(tokenManager: tokenManager));
    _dio.interceptors.add(TokenInterceptor(apiManager: this));
    _dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));

    // await testRun();
  }

  testRun() async {
    var res = await _dio.get(EnvDev.kettleHost);
    if (res.data["success"]) {
      debugPrint("All systems up and running");
    } else {
      debugPrint("Backend is down");
    }
  }

  Dio client({bool isRefresh = false}) {
    String? accessToken = tokenManager.accessToken;
    Map<String, dynamic> headers = _dio.options.headers;

    if (!isRefresh && accessToken != null) {
      headers.addAll({'Authorization': accessToken});
      _dio.options.headers = headers;
      return _dio;
    } else {
      headers.remove('Authorization');
      _dio.options.headers = headers;
      return _dio;
    }
  }

  Future<Response> get(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  // Future<Response> post(
  //   String path, {
  //   Options? options,
  //   Map<String, dynamic>? queryParameters,
  //   dynamic data,
  // }) async {
  //   return await _dio.post(
  //     path,
  //     options: options,
  //     data: data,
  //     queryParameters: queryParameters,
  //   );
  // }

  // Future<Response> put(
  //   String path, {
  //   Options? options,
  //   Map<String, dynamic>? queryParameters,
  //   dynamic data,
  // }) async {
  //   return await _dio.put(
  //     path,
  //     options: options,
  //     data: data,
  //     queryParameters: queryParameters,
  //   );
  // }

  // Future<Response> delete(
  //   String path, {
  //   Options? options,
  //   Map<String, dynamic>? queryParameters,
  //   dynamic data,
  // }) async {
  //   return await _dio.delete(
  //     path,
  //     options: options,
  //     queryParameters: queryParameters,
  //     data: data,
  //   );
  // }
}
