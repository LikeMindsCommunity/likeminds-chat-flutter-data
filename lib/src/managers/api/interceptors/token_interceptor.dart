import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/constant/string_constant.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';

class TokenInterceptor extends Interceptor {
  final ApiManager apiManager;
  LMChatSDKCallback? callback;

  TokenInterceptor({required this.apiManager}) {
    callback = LMChatServiceProvider.instance.sdkCallback;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint("Authenticated request completed");
     debugPrint("this is this auth $callback");
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      debugPrint("this is this$callback");
      if (!err.response!.requestOptions.path.contains("user/refresh")) {
        debugPrint("Authenticated request failed in onError");
        await refreshToken();
        final newRes = await _retry(apiManager.client(), err.requestOptions);
        handler.resolve(newRes);
      } else {
        apiManager.tokenManager.clearTokens();
        debugPrint("Authenticated request failed in onError");
        LMAuthToken? request = await callback?.onRefreshTokenExpired.call();
        if (request != null) {
          handler.resolve(Response(requestOptions: err.requestOptions, data: {
            "success": true,
            "data": {
              "access_token": request.accessToken,
              "refresh_token": request.refreshToken
            }
          }));
        } else {
          handler.reject(err);
        }
      }
    } else {
      debugPrint("Authenticated request failed except LTM");
      return super.onError(err, handler);
    }
  }

  Future<void> refreshToken() async {
    debugPrint("Refreshing token");
    LMResponse refreshTokenResponse =
        LMChatPersistence.instance.getCache(kRefreshToken);
    if (!refreshTokenResponse.success ||
        refreshTokenResponse.data == null ||
        refreshTokenResponse.data!.value == null) {
      throw Exception("Refresh token not found.");
    }
    String refreshToken = refreshTokenResponse.data!.value;
    final response = await AuthService(apiManager: apiManager)
        .refreshAccessToken(
            (RefreshRequestBuilder()..refreshToken(refreshToken)).build());
    if (response.success) {
      final newAccessToken = response.data!.accessToken;
      final newRefreshToken = response.data!.refreshToken;
      await apiManager.tokenManager.updateTokens(
        newAccessToken!,
        newRefreshToken!,
      );
      callback?.onAccessTokenExpiredAndRefreshed.call(
        newAccessToken,
        newRefreshToken,
      );
    } else {
      // apiManager.tokenManager.clearTokens();
      // throw Exception("Token refresh failed");
      apiManager.tokenManager.clearTokens();
      debugPrint("Authenticated request failed in onError");
      LMAuthToken? request = await callback?.onRefreshTokenExpired.call();
      if (request != null) {
        apiManager.tokenManager
            .updateTokens(request.accessToken, request.refreshToken);
      } else {
        throw Exception("Token refresh failed");
      }
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
