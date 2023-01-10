library likeminds_groupchat;

import 'package:likeminds_groupchat/src/models/sdk/init_extra_model.dart';

/// The starting class of the SDK
class LikeMindsGroupChat {
  void initiateLikeMinds(InitiateLikeMindsChatExtra extras) {
    //Implement initiate call
  }

  void logout() {}

  void initiateGroupChat() {}

  void parseDeepLink() {}
}

final InitiateLikeMindsChatExtra extras = InitiateLikeMindsChatExtra(
  application: "application",
  apiKey: "apiKey",
);
