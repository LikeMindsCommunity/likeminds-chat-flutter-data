import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

class LogoutRequest {
  final String? refreshToken;
  final String? deviceId;
  final LMSdkCallback callback = DIService.getIt.get<LMSdkCallback>(
    instanceName: "LMCallback",
  );

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
      refreshToken: _refreshToken!,
      deviceId: _deviceId!,
    );
  }
}
