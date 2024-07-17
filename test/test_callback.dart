import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/models/auth/auth_token_model.dart';

class TestCallback extends LMChatSDKCallback {
  @override
  void eventFiredCallback(String eventKey, Map<String, dynamic> propertiesMap) {
    debugPrint("Unit testing; eventFiredCallback: $eventKey, $propertiesMap");
  }

  @override
  void loginRequiredCallback() {
    debugPrint("Unit testing; loginRequiredCallback");
  }

  @override
  void logoutCallback() {
    debugPrint("Unit testing; logoutCallback");
  }

  @override
  void onAccessTokenExpiredAndRefreshed(String accessToken, String refreshToken) {
    // TODO: implement onAccessTokenExpiredAndRefreshed
  }

  @override
  Future<LMAuthToken> onRefreshTokenExpired() {
    // TODO: implement onRefreshTokenExpired
    throw UnimplementedError();
  }
}
