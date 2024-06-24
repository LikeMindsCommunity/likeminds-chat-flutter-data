import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/services/service_provider.dart';

class LogoutRequest {
  final String? refreshToken;
  final String? deviceId;
  final LMChatSDKCallback? callback = LMChatServiceProvider.instance.sdkCallback;

  LogoutRequest._({
    required this.refreshToken,
    required this.deviceId,
  });
}

class LogoutRequestBuilder {
  String? _refreshToken;
  String? _deviceId;

  void refreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  void deviceId(String deviceId) {
    _deviceId = deviceId;
  }

  LogoutRequest build() {
    return LogoutRequest._(
      refreshToken: _refreshToken,
      deviceId: _deviceId,
    );
  }
}
