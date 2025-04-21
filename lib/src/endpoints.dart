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
  String get editProfileEndpoint => "$KETTLE_HOST/community/member/profile";

  String get memberStateEndpoint => "$KETTLE_HOST/community/member/state";

  String get registerDeviceEndpoint => "$KETTLE_HOST/user/device/push";

  String get homeFeedEndpoint => "$KETTLE_HOST/chatroom/sync";

  String get communityEndpoint => "$KETTLE_HOST/community";

  /// Endpoint for fetching community configurations.
  String get communityConfigurationsEndpoint =>
      "$KETTLE_HOST/community/configurations";

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
  String get searchConversationEndpoint => "$KETTLE_HOST/conversation/search";

  String get mediaUploadEndpoint => "$KETTLE_HOST/helper/media/upload";

  String get tagsEndpoint => "$KETTLE_HOST/community/tag";
  String get reportTagEndpoint => "$KETTLE_HOST/community/report/tag";
  String get reportEndpoint => "$KETTLE_HOST/community/report";

  String get decodeUrlEndpoint => "$KETTLE_HOST/helper/url";

  String get exploreFeedEndpoint => "$KETTLE_HOST/community/feed";
  String get exploreTabCountEndpoint =>
      "$KETTLE_HOST/community/member/home/meta";

  String get pollUsersEndpoint => "$KETTLE_HOST/conversation/poll/users";
  String get pollAddOptionEndpoint => "$KETTLE_HOST/conversation/poll";
  String get pollSubmitEndpoint => "$KETTLE_HOST/conversation/poll/submit";

  String get checkDMEndpoint => "$KETTLE_HOST/home/dm/meta";
  String get dmEndpoint => "$KETTLE_HOST/chatroom/sync";
  String get checkDMStatusEndpoint => "$KETTLE_HOST/community/dm/status";
  String get getAllMembersEndpoint => "$KETTLE_HOST/community/member";
  String get searchMembersEndpoint => "$KETTLE_HOST/community/member/search";
  String get checkDMLimitEndpoint => "$KETTLE_HOST/chatroom/dm/limit";
  String get createDMChatroomEndpoint => "$KETTLE_HOST/chatroom/dm/create";
  String get sendDMRequestEndpoint => "$KETTLE_HOST/chatroom/dm/request";
  String get blockMemberEndpoint => "$KETTLE_HOST/chatroom/dm/block";
}
