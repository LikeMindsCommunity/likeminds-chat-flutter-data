import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/endpoints.dart';
import 'package:likeminds_chat_fl/src/environment/env.dart';
import 'package:likeminds_chat_fl/src/managers/api/interceptors/common_header_interceptor.dart';
import 'package:likeminds_chat_fl/src/managers/api/interceptors/log_interceptor.dart';
import 'package:likeminds_chat_fl/src/managers/token_manager.dart';

import 'interceptors/token_interceptor.dart';

class ApiManager {
  final TokenManager tokenManager;

  ApiManager({
    required this.tokenManager,
  }) {
    endPoints = EndPoints.instance(true);
    _init();
  }

  late final EndPoints endPoints;
  final Dio _dio = Dio();

  _init() {
    Map<String, dynamic> headers = {
      "x-platform-code": EnvDev.platformCode,
      "x-version-code": EnvDev.versionCode,
    };

    BaseOptions options = BaseOptions(headers: headers);
    _dio.options = options;
    _dio.interceptors.add(Logging());
    _dio.interceptors.add(CommonHeaderInterceptor(apiManager: this));
    _dio.interceptors.add(TokenInterceptor(apiManager: this));
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
  }) async {
    return await _dio.delete(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }
}
