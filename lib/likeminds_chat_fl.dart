library likeminds_chat_fl;

export 'package:likeminds_chat_fl/src/models/models.dart';
export 'package:likeminds_chat_fl/src/methods/callback.dart';
export 'package:likeminds_chat_fl/src/services/di_service.dart';

import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/methods/notification.dart';
import 'package:likeminds_chat_fl/src/methods/sdk.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

/// Flutter flavour/environment manager v0.0.1

const bool _prodFlag = !bool.fromEnvironment('DEBUG');

/// The starting point class of the SDK
class LMChatClient {
  late final SDKApplication _sdkApplication;

  final String _apiKey;
  final LMSDKCallback? _sdkCallback;

  LMChatClient._({
    required String apiKey,
    LMSDKCallback? sdkCallback,
  })  : _apiKey = apiKey,
        _sdkCallback = sdkCallback {
    debugPrint("LMChatClient initialized");
    DIService.instance.init(_apiKey, _prodFlag, _sdkCallback);
    _sdkApplication = SDKApplication().initialize();
  }

  /// The method to login the user
  Future<LMResponse<InitiateUserResponse>> initiateUser(
      InitiateUserRequest request) {
    return _sdkApplication.getAuthApi().initiateUser(request);
  }

  Future<LMResponse<MemberStateResponse>> getMemberState() async {
    return await _sdkApplication.getAccessApi().getMemberState();
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

  /// The method to get home explore feed count
  Future<LMResponse<GetExploreTabCountResponse>> getExploreTabCount() {
    return _sdkApplication.getExploreApi().getExploreTabCount();
  }

  /// The method to get home explore feed
  Future<LMResponse<GetExploreFeedResponse>> getExploreFeed(
      GetExploreFeedRequest request) {
    return _sdkApplication.getExploreApi().getExploreFeed(request);
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

  /// The method to delete the participant
  Future<LMResponse<DeleteParticipantResponse>> deleteParticipant(
    DeleteParticipantRequest request,
  ) {
    return _sdkApplication.getChatroomApi().deleteParticipant(request);
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

  /// The method to edit the chatroom conversation
  Future<LMResponse<EditConversationResponse>> editConversation(
    EditConversationRequest request,
  ) {
    return _sdkApplication.getConversationApi().editConversation(request);
  }

  /// The method to delete the chatroom conversation
  Future<LMResponse<DeleteConversationResponse>> deleteConversation(
    DeleteConversationRequest request,
  ) {
    return _sdkApplication.getConversationApi().deleteConversation(request);
  }

  /// The method to put multimedia in a chat item
  Future<LMResponse<PutMediaResponse>> putMultimedia(PutMediaRequest request) {
    return _sdkApplication.getMediaApi().putMultimedia(request);
  }

  /// The method to put reactions for a conversation
  Future<LMResponse<PutReactionResponse>> putReaction(
    PutReactionRequest request,
  ) {
    return _sdkApplication.getReactionApi().putReaction(request);
  }

  /// The method to delete reaction for a conversation
  Future<LMResponse<DeleteReactionResponse>> deleteReaction(
    DeleteReactionRequest request,
  ) {
    return _sdkApplication.getReactionApi().deleteReaction(request);
  }

  /// The method to register device for notifications
  Future<LMResponse<RegisterDeviceResponse>> registerDevice(
      RegisterDeviceRequest request) {
    return LMNotifications.registerDevice(request);
  }

  /// The method to get chatroom's participants
  Future<LMResponse<GetParticipantsResponse>> getParticipants(
      GetParticipantsRequest request) {
    return _sdkApplication.getParticipantsApi().getParticipants(request);
  }

  /// The method to get chatroom's tagging list
  Future<LMResponse<TagResponseModel>> getTaggingList(TagRequestModel request) {
    return _sdkApplication.getHelperApi().getTags(request: request);
  }

  /// The method to get link's preview
  Future<LMResponse<DecodeUrlResponse>> decodeUrl(DecodeUrlRequest request) {
    return _sdkApplication.getHelperApi().decodeUrl(request: request);
  }

  /// The method to get poll users
  Future<LMResponse<GetPollUsersResponse>> getPollUsers(
      GetPollUsersRequest request) {
    return _sdkApplication.getPollApi().getPollUsers(request);
  }

  /// The method to add poll option
  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest request) {
    return _sdkApplication.getPollApi().addPollOption(request);
  }

  /// The method to submit poll
  Future<LMResponse<SubmitPollResponse>> submitPoll(SubmitPollRequest request) {
    return _sdkApplication.getPollApi().submitPoll(request);
  }

  /// The method to get post poll
  Future<LMResponse<PostConversationResponse>> postPollConversation(
      PostPollConversationRequest request) {
    return _sdkApplication.getPollApi().postPollConversation(request);
  }

  ///DM Functions

  /// The method to check the status of DM tab
  Future<LMResponse<CheckDMTabResponse>> checkDMTab() {
    return _sdkApplication.getDMApi().checkDMTab();
  }

  /// The method to fetch the DM feed
  Future<LMResponse<FetchDMFeedResponse>> getDMFeed(
      FetchDMFeedRequest request) {
    return _sdkApplication.getDMApi().fetchDMFeed(request);
  }

  /// The method to check the DM status
  Future<LMResponse<CheckDMStatusResponse>> checkDMStatus(
      CheckDMStatusRequest request) {
    return _sdkApplication.getDMApi().checkDMStatus(request);
  }
}

/// Builder class to initiate the SDK
/// [apiKey] is the API key provided by LikeMinds
/// [sdkCallback] is the callback to handle the events
/// Returns a new instance of the SDK [LMChatClient]
class LMChatClientBuilder {
  String? _apiKey;
  LMSDKCallback? _sdkCallback;

  void apiKey(String apiKey) {
    _apiKey = apiKey;
  }

  void sdkCallback(LMSDKCallback? sdkCallback) {
    _sdkCallback = sdkCallback;
  }

  LMChatClient build() {
    if (_apiKey == null) {
      throw Exception("API key is required");
    }
    return LMChatClient._(
      apiKey: _apiKey!,
      sdkCallback: _sdkCallback,
    );
  }
}
