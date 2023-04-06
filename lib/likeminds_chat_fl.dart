library likeminds_chat_fl;

export 'package:likeminds_chat_fl/src/models/models.dart';
export 'package:likeminds_chat_fl/src/methods/callback.dart';

import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/methods/sdk.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

/// ONLY FOR INTERNAL TESTING
const bool _prodFlag = false;

/// The starting point class of the SDK
class LMChatClient {
  late final SdkApplication _sdkApplication;

  final String _apiKey;
  final LMSdkCallback _sdkCallback;

  LMChatClient._({
    required String apiKey,
    required LMSdkCallback sdkCallback,
  })  : _apiKey = apiKey,
        _sdkCallback = sdkCallback {
    debugPrint("LMChatClient initialized");
    DIService.instance.init(_apiKey, _prodFlag, _sdkCallback);
    _sdkApplication = SdkApplication().initialize();
  }

  /// The static method to initiate the SDK
  /// [apiKey] is the API key provided by LikeMinds
  /// [sdkCallback] is the callback to handle the events
  /// Returns a new instance of the SDK [LMChatClient]
  static LMChatClient initiateLikeMinds({
    required String apiKey,
    required LMSdkCallback sdkCallback,
  }) {
    return LMChatClient._(
      apiKey: apiKey,
      sdkCallback: sdkCallback,
    );
  }

  /// The method to login the user
  Future<LMResponse<InitiateUserResponse>> initiateUser(
      InitiateUserRequest request) {
    return _sdkApplication.getAuthApi().initiateUser(request);
  }

  /// The method to logout the user
  Future<LMResponse<LogoutResponse>> logout(LogoutRequest request) {
    return _sdkApplication.getAuthApi().logout(request);
  }

  /// The method to get chat home feed
  Future<LMResponse<GetHomeFeedResponse>> getHomeFeed(
      GetHomeFeedRequest request) {
    return _sdkApplication.getHomeApi().getHomeFeed(request);
  }

  /// The method to get a single chatroom
  Future<LMResponse<GetChatroomResponse>> getChatroom(
    GetChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().getChatroom(request);
  }

  /// The method to follow the chatroom
  Future<LMResponse<FollowChatroomResponse>> followChatroom(
    FollowChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().followChatroom(request);
  }

  /// The method to mute the chatroom
  Future<LMResponse<MuteChatroomResponse>> muteChatroom(
    MuteChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().muteChatroom(request);
  }

  /// The method to mark read the chatroom
  Future<LMResponse<MarkReadChatroomResponse>> markReadChatroom(
    MarkReadChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().markReadChatroom(request);
  }

  /// The method to share the chatroom
  Future<LMResponse<ShareChatroomResponse>> shareChatroomUrl(
    ShareChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().shareChatroomUrl(request);
  }

  /// The method to set the chatroom topic
  Future<LMResponse<SetChatroomTopicResponse>> setChatroomTopic(
    SetChatroomTopicRequest request,
  ) {
    return _sdkApplication.getChatroomApi().setChatroomTopic(request);
  }

  /// The method to get the chatroom conversation
  Future<LMResponse<GetConversationResponse>> getConversation(
    GetConversationRequest request,
  ) {
    return _sdkApplication.getConversationApi().getConversation(request);
  }

  /// The method to post the chatroom conversation
  Future<LMResponse<PostConversationResponse>> postConversation(
    PostConversationRequest request,
  ) {
    return _sdkApplication.getConversationApi().postConversation(request);
  }
}
