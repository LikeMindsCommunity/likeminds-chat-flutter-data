import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';

class CommonHeaderInterceptor extends Interceptor {
  final ApiManager apiManager;
  CommonHeaderInterceptor({required this.apiManager});

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (apiManager.tokenManager.accessToken == null) {
      return options;
    } else {
      options.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': apiManager.tokenManager.accessToken,
      });
      return options;
    }
  }
}
