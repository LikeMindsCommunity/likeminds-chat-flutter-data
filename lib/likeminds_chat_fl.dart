library likeminds_chat_fl;

export 'package:likeminds_chat_fl/src/methods/sdk.dart';
export 'package:likeminds_chat_fl/src/models/models.dart';

import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/methods/sdk.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

/// The starting class of the SDK
class LikeMindsChatClient {
  SdkApplication initiateLikeMinds({
    required String apiKey,
    required bool isProduction,
    required LMSdkCallback sdkCallback,
  }) {
    DIService.instance.init(apiKey, isProduction, sdkCallback);
    SdkApplication sdkApplication = SdkApplication().initialize();
    return sdkApplication;
  }

  void logout() {}

  void initiateGroupChat() {}

  void parseDeepLink() {}
}
