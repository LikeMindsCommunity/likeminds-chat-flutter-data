import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/endpoints.dart';
import 'package:likeminds_chat_fl/src/environment/env.dart';
import 'package:likeminds_chat_fl/src/managers/api/interceptors/common_header_interceptor.dart';
import 'package:likeminds_chat_fl/src/managers/api/interceptors/log_interceptor.dart';
import 'package:likeminds_chat_fl/src/managers/token_manager.dart';

import 'interceptors/token_interceptor.dart';

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
      "x-api-key": tokenManager.apiKey,
    };

    BaseOptions options = BaseOptions(headers: headers);
    _dio.options = options;
    _dio.interceptors.add(Logging());
    _dio.interceptors.add(CommonHeaderInterceptor(tokenManager: tokenManager));
    _dio.interceptors.add(TokenInterceptor(apiManager: this));

    // await testRun();
  }

  testRun() async {
    var res = await _dio.get(EnvDev.kettleHost);
    if (res.data["success"]) {
      debugPrint("All systems go");
    } else {
      debugPrint("Backend is down");
    }
  }

  Dio client() => _dio;

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

  Future<Response> post(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return await _dio.post(
      path,
      options: options,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return await _dio.put(
      path,
      options: options,
      data: data,
      queryParameters: queryParameters,
    );
  }

  Future<Response> delete(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return await _dio.delete(
      path,
      options: options,
      queryParameters: queryParameters,
      data: data,
    );
  }
}
