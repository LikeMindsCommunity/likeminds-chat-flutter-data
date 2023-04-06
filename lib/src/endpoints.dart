// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names

import 'package:likeminds_chat_fl/src/environment/env.dart';

/// This class contains all the endpoints used in the SDK
class EndPoints {
  static EndPoints? _instance;
  static EndPoints instance(bool? isProd) =>
      _instance ??= EndPoints._(isProduction: isProd ?? false);

  final bool isProduction;
  final int pageLimit = 10;

  EndPoints._({required this.isProduction});

  String get CARAVAN_HOST =>
      isProduction ? EnvProd.caravanHost : EnvDev.caravanHost;
  String get KETTLE_HOST =>
      isProduction ? EnvProd.kettleHost : EnvDev.kettleHost;

  String get authEndpoint => "$KETTLE_HOST/sdk/initiate";
  String get authRefreshEndpoint => "$KETTLE_HOST/user/refresh";
  String get authLogoutEndpoint => "$KETTLE_HOST/user/logout";

  String get registerDeviceEndpoint => "$CARAVAN_HOST/push";

  String getBrandingEndPoint(String communityId) {
    return "$CARAVAN_HOST/community/$communityId/branding";
  }

  String get homeFeedEndpoint => "$KETTLE_HOST/chatroom/mine";

  String get chatroomEndpoint => "$KETTLE_HOST/chatroom";
  String get chatroomFollowEndpoint => "$KETTLE_HOST/chatroom/follow";
  String get chatroomMuteEndpoint => "$KETTLE_HOST/chatroom/mute";
  String get chatroomMarkReadEndpoint => "$KETTLE_HOST/chatroom/mark_read";
  String get chatroomShareEndpoint => "$KETTLE_HOST/chatroom/share";
  String get chatroomSetTopicEndpoint => "$KETTLE_HOST/conversation/topic";

  String get conversationEndpoint => "$KETTLE_HOST/conversation";
  String get conversationSyncEndpoint => "$KETTLE_HOST/conversation/sync";
}
