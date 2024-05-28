library likeminds_chat_fl;

export 'package:likeminds_chat_fl/src/models/models.dart';
export 'package:likeminds_chat_fl/src/methods/callback.dart';
export 'package:likeminds_chat_fl/src/services/di_service.dart';
export 'package:likeminds_chat_fl/src/utils/enums.dart';

import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/methods/notification.dart';
import 'package:likeminds_chat_fl/src/methods/sdk.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';
import 'package:likeminds_chat_fl/src/utils/enums.dart';

/// Flutter flavour/environment manager v0.0.1
const bool _prodFlag = !bool.fromEnvironment('DEBUG');

const String chatSDKVersion = '1.6.0';

/// The starting point class of the SDK
class LMChatClient {
  late final SDKApplication _sdkApplication;

  final String _apiKey;
  final LMSDKCallback? _sdkCallback;
  static List<ConversationState>? _excludedConversationStates;

  LMChatClient._({
    required String apiKey,
    LMSDKCallback? sdkCallback,
  })  : _apiKey = apiKey,
        _sdkCallback = sdkCallback {
    debugPrint("LMChatClient initialized");
    DIService.instance.init(_apiKey, _prodFlag, _sdkCallback);
    _sdkApplication = SDKApplication().initialize();
  }

  // ------------------------------------------
  // Authentication APIs
  // Use these to initiate, refresh, and logout user

  /// initiateUser is used to initiate a user session
  /// [InitiateUserRequest] is used to pass the required parameters
  /// [InitiateUserResponse] is returned as a Future
  Future<LMResponse<InitiateUserResponse>> initiateUser(
      InitiateUserRequest request) {
    return _sdkApplication.getAuthApi().initiateUser(request);
  }

  /// logout is used to logout a user session
  /// [LogoutRequest] is used to pass the required parameters
  /// [LogoutResponse] is returned as a Future
  Future<LMResponse<void>> logout(LogoutRequest request) {
    return _sdkApplication.getAuthApi().logout(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Access APIs
  // Use these to fetch member state

  /// getMemberState is used to fetch the member state
  /// [MemberStateResponse] is returned as a Future
  Future<LMResponse<MemberStateResponse>> getMemberState() async {
    return await _sdkApplication.getAccessApi().getMemberState();
  }
  // ------------------------------------------

  // ------------------------------------------
  // Home APIs
  // Use these to fetch home feed, and explore tab count

  /// getHomeFeed is used to fetch the chat home feed
  /// [GetHomeFeedRequest] is used to pass the required parameters
  /// [GetHomeFeedResponse] is returned as a Future
  Future<LMResponse<GetHomeFeedResponse>> getHomeFeed(
      GetHomeFeedRequest request) {
    return _sdkApplication.getHomeApi().getHomeFeed(request);
  }

  /// getExploreTabCount is used to fetch the home explore tab count
  /// [GetExploreTabCountResponse] is returned as a Future
  Future<LMResponse<GetExploreTabCountResponse>> getExploreTabCount() {
    return _sdkApplication.getExploreApi().getExploreTabCount();
  }

  /// getExploreFeed is used to fetch the home explore feed
  /// [GetExploreFeedRequest] is used to pass the required parameters
  /// [GetExploreFeedResponse] is returned as a Future
  Future<LMResponse<GetExploreFeedResponse>> getExploreFeed(
      GetExploreFeedRequest request) {
    return _sdkApplication.getExploreApi().getExploreFeed(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Chatroom APIs
  // Use these to fetch, follow, delete, mute, and mark chatrooms

  /// getChatroom is used to fetch a single chatroom
  /// [GetChatroomRequest] is used to pass the required parameters
  /// [GetChatroomResponse] is returned as a Future
  Future<LMResponse<GetChatroomResponse>> getChatroom(
    GetChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().getChatroom(request);
  }

  /// followChatroom is used to follow a chatroom
  /// [FollowChatroomRequest] is used to pass the required parameters
  /// [FollowChatroomResponse] is returned as a Future
  Future<LMResponse<FollowChatroomResponse>> followChatroom(
    FollowChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().followChatroom(request);
  }

  /// deleteParticipant is used to delete a participant from a chatroom
  /// [DeleteParticipantRequest] is used to pass the required parameters
  /// [DeleteParticipantResponse] is returned as a Future
  Future<LMResponse<DeleteParticipantResponse>> deleteParticipant(
    DeleteParticipantRequest request,
  ) {
    return _sdkApplication.getChatroomApi().deleteParticipant(request);
  }

  /// muteChatroom is used to mute a chatroom
  /// [MuteChatroomRequest] is used to pass the required parameters
  /// [MuteChatroomResponse] is returned as a Future
  Future<LMResponse<MuteChatroomResponse>> muteChatroom(
    MuteChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().muteChatroom(request);
  }

  /// markReadChatroom is used to mark a chatroom as read
  /// [MarkReadChatroomRequest] is used to pass the required parameters
  /// [MarkReadChatroomResponse] is returned as a Future
  Future<LMResponse<MarkReadChatroomResponse>> markReadChatroom(
    MarkReadChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().markReadChatroom(request);
  }

  /// shareChatroomUrl is used to share the chatroom URL
  /// [ShareChatroomRequest] is used to pass the required parameters
  /// [ShareChatroomResponse] is returned as a Future
  Future<LMResponse<ShareChatroomResponse>> shareChatroomUrl(
    ShareChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().shareChatroomUrl(request);
  }

  /// setChatroomTopic is used to set the chatroom topic
  /// [SetChatroomTopicRequest] is used to pass the required parameters
  /// [SetChatroomTopicResponse] is returned as a Future
  Future<LMResponse<SetChatroomTopicResponse>> setChatroomTopic(
    SetChatroomTopicRequest request,
  ) {
    return _sdkApplication.getChatroomApi().setChatroomTopic(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Conversation APIs
  // Use these to fetch, post, edit, and delete conversations

  /// getConversation is used to fetch the chatroom conversation
  /// [GetConversationRequest] is used to pass the required parameters
  /// [GetConversationResponse] is returned as a Future
  Future<LMResponse<GetConversationResponse>> getConversation(
    GetConversationRequest request,
  ) {
    if (_excludedConversationStates != null &&
        _excludedConversationStates!.isNotEmpty &&
        request.excludedConversationStates == null) {
      List<int> states = [];
      _excludedConversationStates?.forEach((element) {
        states.add(element.toInt());
      });

      final conversationRequest = request.copyWith(
        excludedConversationStates: states,
      );
      return _sdkApplication
          .getConversationApi()
          .getConversation(conversationRequest);
    }
    return _sdkApplication.getConversationApi().getConversation(request);
  }

  /// postConversation is used to post a conversation in a chatroom
  /// [PostConversationRequest] is used to pass the required parameters
  /// [PostConversationResponse] is returned as a Future
  Future<LMResponse<PostConversationResponse>> postConversation(
    PostConversationRequest request,
  ) {
    return _sdkApplication.getConversationApi().postConversation(request);
  }

  /// editConversation is used to edit a conversation in a chatroom
  /// [EditConversationRequest] is used to pass the required parameters
  /// [EditConversationResponse] is returned as a Future
  Future<LMResponse<EditConversationResponse>> editConversation(
    EditConversationRequest request,
  ) {
    return _sdkApplication.getConversationApi().editConversation(request);
  }

  /// deleteConversation is used to delete a conversation from a chatroom
  /// [DeleteConversationRequest] is used to pass the required parameters
  /// [DeleteConversationResponse] is returned as a Future
  Future<LMResponse<DeleteConversationResponse>> deleteConversation(
    DeleteConversationRequest request,
  ) {
    return _sdkApplication.getConversationApi().deleteConversation(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Media APIs
  // Use these to upload multimedia in a conversation

  /// putMultimedia is used to put multimedia in a chat item
  /// [PutMediaRequest] is used to pass the required parameters
  /// [PutMediaResponse] is returned as a Future
  Future<LMResponse<PutMediaResponse>> putMultimedia(PutMediaRequest request) {
    return _sdkApplication.getMediaApi().putMultimedia(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Reaction APIs
  // Use these to put and delete reactions for a conversation

  /// putReaction is used to put a reaction for a conversation
  /// [PutReactionRequest] is used to pass the required parameters
  /// [PutReactionResponse] is returned as a Future
  Future<LMResponse<PutReactionResponse>> putReaction(
    PutReactionRequest request,
  ) {
    return _sdkApplication.getReactionApi().putReaction(request);
  }

  /// deleteReaction is used to delete a reaction for a conversation
  /// [DeleteReactionRequest] is used to pass the required parameters
  /// [DeleteReactionResponse] is returned as a Future
  Future<LMResponse<DeleteReactionResponse>> deleteReaction(
    DeleteReactionRequest request,
  ) {
    return _sdkApplication.getReactionApi().deleteReaction(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Notification APIs
  // Use these to register device for notifications

  /// registerDevice is used to register a device for receiving notifications
  /// [RegisterDeviceRequest] is used to pass the required parameters
  /// [RegisterDeviceResponse] is returned as a Future
  Future<LMResponse<RegisterDeviceResponse>> registerDevice(
      RegisterDeviceRequest request) {
    return LMNotifications.registerDevice(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Participants APIs
  // Use these to fetch chatroom participants

  /// getParticipants is used to fetch the chatroom's participants
  /// [GetParticipantsRequest] is used to pass the required parameters
  /// [GetParticipantsResponse] is returned as a Future
  Future<LMResponse<GetParticipantsResponse>> getParticipants(
      GetParticipantsRequest request) {
    return _sdkApplication.getParticipantsApi().getParticipants(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Helper APIs
  // Use these to fetch tagging list, decode URLs, and more

  /// getTaggingList is used to fetch the chatroom's tagging list
  /// [TagRequestModel] is used to pass the required parameters
  /// [TagResponseModel] is returned as a Future
  Future<LMResponse<TagResponseModel>> getTaggingList(TagRequestModel request) {
    return _sdkApplication.getHelperApi().getTags(request: request);
  }

  /// decodeUrl is used to fetch the link's preview
  /// [DecodeUrlRequest] is used to pass the required parameters
  /// [DecodeUrlResponse] is returned as a Future
  Future<LMResponse<DecodeUrlResponse>> decodeUrl(DecodeUrlRequest request) {
    return _sdkApplication.getHelperApi().decodeUrl(request: request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // Poll APIs
  // Use these to fetch poll users, add poll options, submit polls, and post polls

  /// getPollUsers is used to fetch the poll users
  /// [GetPollUsersRequest] is used to pass the required parameters
  /// [GetPollUsersResponse] is returned as a Future
  Future<LMResponse<GetPollUsersResponse>> getPollUsers(
      GetPollUsersRequest request) {
    return _sdkApplication.getPollApi().getPollUsers(request);
  }

  /// addPollOption is used to add a poll option
  /// [AddPollOptionRequest] is used to pass the required parameters
  /// [AddPollOptionResponse] is returned as a Future
  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest request) {
    return _sdkApplication.getPollApi().addPollOption(request);
  }

  /// submitPoll is used to submit a poll
  /// [SubmitPollRequest] is used to pass the required parameters
  /// [SubmitPollResponse] is returned as a Future
  Future<LMResponse<SubmitPollResponse>> submitPoll(SubmitPollRequest request) {
    return _sdkApplication.getPollApi().submitPoll(request);
  }

  /// postPollConversation is used to post a poll conversation
  /// [PostPollConversationRequest] is used to pass the required parameters
  /// [PostConversationResponse] is returned as a Future
  Future<LMResponse<PostConversationResponse>> postPollConversation(
      PostPollConversationRequest request) {
    return _sdkApplication.getPollApi().postPollConversation(request);
  }
  // ------------------------------------------

  // ------------------------------------------
  // DM APIs
  // Use these for direct messaging

  /// checkDMTab is used to check the status of the DM tab
  /// [CheckDMTabResponse] is returned as a Future
  Future<LMResponse<CheckDMTabResponse>> checkDMTab() {
    return _sdkApplication.getDMApi().checkDMTab();
  }

  /// fetchDMFeed is used to fetch a list of all DM chatrooms
  /// [FetchDMFeedResponse] is returned as a future
  Future<LMResponse<FetchDMFeedResponse>> fetchDMFeed(
      FetchDMFeedRequest request) {
    return _sdkApplication.getDMApi().fetchDMFeed(request);
  }

  /// checkDMStatus is used to check the DM status
  /// [CheckDMStatusRequest] is used to pass the required parameters
  /// [CheckDMStatusResponse] is returned as a Future
  Future<LMResponse<CheckDMStatusResponse>> checkDMStatus(
      CheckDMStatusRequest request) {
    return _sdkApplication.getDMApi().checkDMStatus(request);
  }

  /// getAllMembers is used to get all members
  /// [GetAllMembersRequest] is used to pass the required parameters
  /// [GetAllMembersResponse] is returned as a Future
  Future<LMResponse<GetAllMembersResponse>> getAllMembers(
      GetAllMembersRequest request) {
    return _sdkApplication.getDMApi().getAllMembers(request);
  }

  /// searchMembers is used to search members
  /// [SearchMembersRequest] is used to pass the required parameters
  /// [SearchMembersResponse] is returned as a Future
  Future<LMResponse<SearchMembersResponse>> searchMembers(
      SearchMembersRequest request) {
    return _sdkApplication.getDMApi().searchMembers(request);
  }

  /// checkDMLimit is used to check the DM limit
  /// [CheckDMLimitRequest] is used to pass the required parameters
  /// [CheckDMLimitResponse] is returned as a Future
  Future<LMResponse<CheckDMLimitResponse>> checkDMLimit(
      CheckDMLimitRequest request) {
    return _sdkApplication.getDMApi().checkDMLimit(request);
  }

  /// createDMChatroom is used to create a DMChatroom
  /// [CreateDMChatroomRequest] is used to pass the required parameters
  /// [CreateDMChatroomResponse] is returned as a Future
  Future<LMResponse<CreateDMChatroomResponse>> createDMChatroom(
      CreateDMChatroomRequest request) {
    return _sdkApplication.getDMApi().createDMChatroom(request);
  }

  /// sendDMRequest is used to send a DM request
  /// [SendDMRequest] is used to pass the required parameters
  /// [SendDMResponse] is returned as a Future
  Future<LMResponse<SendDMResponse>> sendDMRequest(SendDMRequest request) {
    return _sdkApplication.getDMApi().sendDMRequest(request);
  }

  /// blockMember is used to block a member
  /// [BlockMemberRequest] is used to pass the required parameters
  /// [BlockMemberResponse] is returned as a Future
  Future<LMResponse<BlockMemberResponse>> blockMember(
      BlockMemberRequest request) {
    return _sdkApplication.getDMApi().blockMember(request);
  }
  // ------------------------------------------
}

/// Builder class to initiate the SDK
/// [apiKey] is the API key provided by LikeMinds
/// [sdkCallback] is the callback to handle the events
/// Returns a new instance of the SDK [LMChatClient]
class LMChatClientBuilder {
  String? _apiKey;
  LMSDKCallback? _sdkCallback;
  List<ConversationState>? _excludedConversationStates;

  void apiKey(String apiKey) {
    _apiKey = apiKey;
  }

  void sdkCallback(LMSDKCallback? sdkCallback) {
    _sdkCallback = sdkCallback;
  }

  void excludedConversationStates(List<ConversationState> states) {
    _excludedConversationStates = states;
  }

  LMChatClient build() {
    if (_apiKey == null) {
      throw Exception("API key is required");
    }
    LMChatClient._excludedConversationStates = _excludedConversationStates;
    return LMChatClient._(
      apiKey: _apiKey!,
      sdkCallback: _sdkCallback,
    );
  }
}
