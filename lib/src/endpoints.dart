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

  String get memberStateEndpoint => "$KETTLE_HOST/community/member/state";

  String get registerDeviceEndpoint => "$KETTLE_HOST/user/device/push";

  String get homeFeedEndpoint => "$KETTLE_HOST/chatroom/sync";

  String get chatroomEndpoint => "$KETTLE_HOST/chatroom";
  String get chatroomFollowEndpoint => "$KETTLE_HOST/chatroom/follow";
  String get chatroomMuteEndpoint => "$KETTLE_HOST/chatroom/mute";
  String get chatroomMarkReadEndpoint => "$KETTLE_HOST/chatroom/mark_read";
  String get chatroomShareEndpoint => "$KETTLE_HOST/chatroom/share";
  String get chatroomParticipantsEndpoint =>
      "$KETTLE_HOST/chatroom/participants";
  String get chatroomSetTopicEndpoint => "$KETTLE_HOST/conversation/topic";

  String get conversationEndpoint => "$KETTLE_HOST/conversation";
  String get conversationSyncEndpoint => "$KETTLE_HOST/conversation/sync";
  String get reactionEndpoint => "$KETTLE_HOST/conversation/reaction";

  String get mediaUploadEndpoint => "$KETTLE_HOST/helper/media/upload";

  String get tagsEndpoint => "$KETTLE_HOST/community/tag";

  String get decodeUrlEndpoint => "$KETTLE_HOST/helper/url";

  String get exploreFeedEndpoint => "$KETTLE_HOST/community/feed";
  String get exploreTabCountEndpoint =>
      "$KETTLE_HOST/community/member/home/meta";

  String get checkDMEndpoint => "$KETTLE_HOST/home/dm/meta";
}
