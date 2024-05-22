import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';

class TokenInterceptor extends Interceptor {
  final ApiManager apiManager;
  TokenInterceptor({required this.apiManager});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401 &&
        response.data["error_message"] == "Invalid LTM!") {
      debugPrint("Authenticated request failed LTM in response");
      await refreshToken();
      return super.onResponse(response, handler);
    } else {
      debugPrint("Authenticated request completed");
      return super.onResponse(response, handler);
    }
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    Dio dio = Dio();
    if (err.response?.statusCode == 401 &&
        err.response?.data["error_message"] == "Invalid LTM!") {
      debugPrint("Authenticated request failed in onError");
      await refreshToken();
      final newRes = await _retry(dio, err.requestOptions);
      handler.resolve(newRes);
    } else {
      debugPrint("Authenticated request failed except LTM");
      return super.onError(err, handler);
    }
  }

  Future<void> refreshToken() async {
    debugPrint("Refreshing token");
    final refreshToken = apiManager.tokenManager.refreshToken;
    final response = await AuthService(apiManager: apiManager).refresh(
      (RefreshRequestBuilder()..refreshTokem(refreshToken!)).build(),
    );

    if (response.success) {
      apiManager.tokenManager.initTokens(
        response.accessToken!,
        response.refreshToken!,
      );
    }
  }

  Future<Response<dynamic>> _retry(
      Dio dio, RequestOptions requestOptions) async {
    final options = Options(method: requestOptions.method, headers: {
      'Authorization': apiManager.tokenManager.accessToken,
    });
    return await dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
