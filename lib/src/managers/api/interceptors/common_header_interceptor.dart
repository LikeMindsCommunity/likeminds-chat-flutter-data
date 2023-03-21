import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/token_manager.dart';

class CommonHeaderInterceptor extends Interceptor {
  final TokenManager tokenManager;
  CommonHeaderInterceptor({required this.tokenManager});

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (tokenManager.accessToken == null) {
      return super.onRequest(options, handler);
    } else {
      options.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': tokenManager.accessToken,
      });
      return super.onRequest(options, handler);
    }
  }
}
