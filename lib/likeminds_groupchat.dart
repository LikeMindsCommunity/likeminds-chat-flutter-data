library likeminds_groupchat;

export 'package:likeminds_groupchat/src/methods/sdk.dart';
export 'package:likeminds_groupchat/src/models/models.dart';

import 'package:likeminds_groupchat/src/methods/sdk.dart';

/// The starting class of the SDK
class LikeMindsGroupChat {
  SdkApplication initiateLikeMinds() {
    SdkApplication sdkApplication = SdkApplication().initialize();
    return sdkApplication;
  }

  void logout() {}

  void initiateGroupChat() {}

  void parseDeepLink() {}
}
