import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

class LogoutRequest {
  final String? refreshToken;
  final String? deviceId;
  final LMSdkCallback callback = DIService.getIt.get<LMSdkCallback>(
    instanceName: "LMCallback",
  );

  LogoutRequest({
    this.refreshToken,
    this.deviceId,
  });
}
