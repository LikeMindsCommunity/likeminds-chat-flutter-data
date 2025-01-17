library likeminds_chat_fl;

export 'package:likeminds_chat_fl/src/models/models.dart';
export 'package:likeminds_chat_fl/src/methods/callback.dart';
export 'package:likeminds_chat_fl/src/services/service_provider.dart';
export 'package:likeminds_chat_fl/src/utils/enums.dart';

import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/methods/notification.dart';
import 'package:likeminds_chat_fl/src/methods/sdk.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';
import 'package:likeminds_chat_fl/src/services/service_provider.dart';
import 'package:likeminds_chat_fl/src/utils/enums.dart';

/// Flutter flavour/environment manager v0.0.2
const bool prodFlag = !bool.fromEnvironment('LM_DEBUG_ENV');
const bool testFlag = bool.fromEnvironment('LM_TEST_ENV');

/// The starting point class of the SDK
class LMChatClient {
  late final SDKApplication _sdkApplication;
  final LMChatSDKCallback _sdkCallback;
  final List<ConversationState>? _excludedConversationStates;
  LMChatClient._({
    required LMChatSDKCallback sdkCallback,
    List<ConversationState>? excludedConversationStates,
  })  : _excludedConversationStates = excludedConversationStates,
        _sdkCallback = sdkCallback {
    debugPrint("LMChatClient initialized");
    LMChatServiceProvider.instance.init(prodFlag, _sdkCallback);
    _sdkApplication = SDKApplication.instance;
  }
  // Initializes the DB
  Future<LMResponse<void>> initiateDB() async {
    return await LMChatPersistence.instance.initiate();
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

  /// validateUser is used to validate a user session
  /// [ValidateUserRequest] is used to pass the required parameters
  /// [ValidateUserResponse] is returned as a Future
  Future<LMResponse<ValidateUserResponse>> validateUser(
      ValidateUserRequest validateUserRequest) async {
    return await _sdkApplication.getAuthApi().validateUser(validateUserRequest);
  }

  /// logout is used to logout a user session
  /// [LogoutRequest] is used to pass the required parameters
  /// [LogoutResponse] is returned as a Future
  Future<LMResponse<void>> logout(LogoutRequest request) {
    return _sdkApplication.getAuthApi().logout(request);
  }

  /// editProfile is used to edit a user's profile
  /// [EditProfileRequest] is used to pass the required parameters
  /// Returns void if successful
  Future<LMResponse<void>> editProfile(EditProfileRequest request) {
    return _sdkApplication.getAuthApi().editProfile(request);
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
  Future<LMResponse<void>> followChatroom(
    FollowChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().followChatroom(request);
  }

  /// deleteParticipant is used to delete a participant from a chatroom
  /// [DeleteParticipantRequest] is used to pass the required parameters
  /// [DeleteParticipantResponse] is returned as a Future
  Future<LMResponse<void>> deleteParticipant(
    DeleteParticipantRequest request,
  ) {
    return _sdkApplication.getChatroomApi().deleteParticipant(request);
  }

  /// muteChatroom is used to mute a chatroom
  /// [MuteChatroomRequest] is used to pass the required parameters
  /// [MuteChatroomResponse] is returned as a Future
  Future<LMResponse<void>> muteChatroom(
    MuteChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().muteChatroom(request);
  }

  /// markReadChatroom is used to mark a chatroom as read
  /// [MarkReadChatroomRequest] is used to pass the required parameters
  /// [MarkReadChatroomResponse] is returned as a Future
  Future<LMResponse<void>> markReadChatroom(
    MarkReadChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().markReadChatroom(request);
  }

  /// shareChatroomUrl is used to share the chatroom URL
  /// [ShareChatroomRequest] is used to pass the required parameters
  /// [ShareChatroomResponse] is returned as a Future
  Future<LMResponse<void>> shareChatroomUrl(
    ShareChatroomRequest request,
  ) {
    return _sdkApplication.getChatroomApi().shareChatroomUrl(request);
  }

  /// setChatroomTopic is used to set the chatroom topic
  /// [SetChatroomTopicRequest] is used to pass the required parameters
  /// [SetChatroomTopicResponse] is returned as a Future
  Future<LMResponse<void>> setChatroomTopic(
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
  Future<LMResponse<void>> putReaction(
    PutReactionRequest request,
  ) {
    return _sdkApplication.getReactionApi().putReaction(request);
  }

  /// deleteReaction is used to delete a reaction for a conversation
  /// [DeleteReactionRequest] is used to pass the required parameters
  /// [DeleteReactionResponse] is returned as a Future
  Future<LMResponse<void>> deleteReaction(
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
  Future<LMResponse<void>> registerDevice(RegisterDeviceRequest request) {
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
  Future<LMResponse<void>> submitPoll(SubmitPollRequest request) {
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
  /// Community APIs
  /// Use these to fetch community configurations
  /// [LMResponse<GetCommunityConfigurationsResponse>] is returned as a Future
  Future<LMResponse<GetCommunityConfigurationsResponse>>
      getCommunityConfigurations() async {
    return await _sdkApplication.getCommunityApi().getCommunityConfigurations();
  }

  /// ------------------------------------------

  // ------------------------------------------
  // Persistence Functions
  // These are used to talk to our persistence layer
  // for implementing caching and local DB

  /// [insertOrUpdateLoggedInUser] is used to insert or update the logged in user
  Future<LMResponse<void>> insertOrUpdateLoggedInUser(User user) async {
    return _sdkApplication.getPersistenceApi().insertOrUpdateUser(user);
  }

  /// [getLoggedInUser] is used to get the logged in user
  LMResponse<User> getLoggedInUser() {
    return _sdkApplication.getPersistenceApi().getUser();
  }

  /// [deleteLoggedInUser] is used to delete the logged in user
  Future<LMResponse<void>> deleteLoggedInUser() async {
    return _sdkApplication.getPersistenceApi().deleteUser();
  }

  /// [insertOrUpdateCache] is used to insert or update the cache
  Future<LMResponse<void>> insertOrUpdateCache(LMChatCache cache) async {
    return _sdkApplication
        .getPersistenceApi()
        .insertOrUpdateValueInCache(cache);
  }

  /// [deleteCache] is used to delete the cache
  Future<LMResponse<void>> deleteCache(String key) async {
    return _sdkApplication.getPersistenceApi().deleteCache(key);
  }

  /// [getCache] is used to get the cache
  LMResponse<LMChatCache> getCache(String key) {
    return _sdkApplication.getPersistenceApi().getCache(key);
  }

  /// [clearCache] is used to clear the cache
  Future<LMResponse<void>> clearCache() async {
    return _sdkApplication.getPersistenceApi().clearCache();
  }

  /// [insertOrUpdateLoggedInMemberState] is used to insert or update the logged in member state
  Future<LMResponse<void>> insertOrUpdateLoggedInMemberState(
      MemberStateResponse memberStateResponse) async {
    return await _sdkApplication
        .getPersistenceApi()
        .insertOrUpdateMemberState(memberStateResponse);
  }

  /// [getLoggedInMemberState] is used to get the logged in member state
  LMResponse<MemberStateResponse> getLoggedInMemberState() {
    return _sdkApplication.getPersistenceApi().getMemberState();
  }

  /// [deleteLoggedInMemberState] is used to delete the logged in member state
  Future<LMResponse<void>> deleteLoggedInMemberState() async {
    return await _sdkApplication.getPersistenceApi().deleteMemberState();
  }

  /// [insertOrUpdateCommunity] is used to insert or update the community
  Future<LMResponse<void>> insertOrUpdateCommunity(Community community) async {
    return await _sdkApplication
        .getPersistenceApi()
        .insertOrUpdateCommunity(community);
  }

  /// [getCommunity] is used to get the community
  LMResponse<Community> getCommunity() {
    return _sdkApplication.getPersistenceApi().getCommunity();
  }

  /// [deleteCommunity] is used to delete the community
  Future<LMResponse<void>> deleteCommunity() async {
    return await _sdkApplication.getPersistenceApi().deleteCommunity();
  }

  /// [setChatroomIdWithAIChatbot] is used to set the chatroom ID with AI chatbot
  Future<LMResponse<void>> setChatroomIdWithAIChatbot(int chatroomId) async {
    return await _sdkApplication
        .getPersistenceApi()
        .setChatroomIdWithAIChatbot(chatroomId);
  }

  /// [getChatroomIdWithAIChatbot] is used to get the chatroom ID with AI chatbot
  LMResponse<int?> getChatroomIdWithAIChatbot() {
    return _sdkApplication.getPersistenceApi().getChatroomIdWithAIChatbot();
  }

  /// [insertOrUpdateCommunityConfigurationsDB] is used to insert or update the community configurations
  Future<LMResponse<void>> insertOrUpdateCommunityConfigurationsDB(
      List<CommunityConfigurations> communityConfigurations) async {
    return await _sdkApplication
        .getPersistenceApi()
        .insertOrUpdateCommunityConfigurations(communityConfigurations);
  }

  /// [getCommunityConfigurationDB] is used to get the community configuration
  LMResponse<CommunityConfigurations> getCommunityConfigurationDB(String type) {
    return _sdkApplication.getPersistenceApi().getCommunityConfiguration(type);
  }

  /// [deleteCommunityConfigurationDB] is used to delete the community configuration
  /// [type] is the type of the community configuration
  /// [LMResponse<void>] is returned as a Future
  Future<LMResponse<void>> deleteCommunityConfigurationDB(String type) async {
    return await _sdkApplication
        .getPersistenceApi()
        .deleteCommunityConfiguration(type);
  }

  /// [clearCommunityConfigurationDB] is used to clear the community configuration
  /// [LMResponse<void>] is returned as a Future
  /// This will clear all the community configurations
  Future<LMResponse<void>> clearCommunityConfigurationDB() async {
    return _sdkApplication.getPersistenceApi().clearCommunityConfigurationDB();
  }

  // ---------------------------------------

  // ------------------------------------------
  // Moderation APIs
  // Use these to report, get report tags.

  /// [getReportTags] is used to get the report tags
  Future<LMResponse<GetReportTagResponse>> getReportTags(
      GetReportTagRequest request) async {
    return await _sdkApplication.getModerationApi().getReportTags(request);
  }

  /// [postReport] is used to post a report
  Future<LMResponse<void>> postReport(PostReportRequest request) async {
    return await _sdkApplication.getModerationApi().postReport(request);
  }

  /// getAIChatbots is used to get the list of AI chatbots in the community
  /// [GetAIChatbotsRequest] is used to pass the required parameters
  /// [GetAIChatbotsResponse] is returned as a Future
  Future<LMResponse<GetAIChatbotsResponse>> getAIChatbots(
    GetAIChatbotsRequest request,
  ) {
    return _sdkApplication.getChatbotApi().getAIChatbots(request);
  }
}

/// Builder class to initiate the SDK
/// [apiKey] is the API key provided by LikeMinds
/// [sdkCallback] is the callback to handle the events
/// Returns a new instance of the SDK [LMChatClient]
class LMChatClientBuilder {
  LMChatSDKCallback? _sdkCallback;
  List<ConversationState>? _excludedConversationStates;

  void sdkCallback(LMChatSDKCallback? sdkCallback) {
    _sdkCallback = sdkCallback;
  }

  void excludedConversationStates(List<ConversationState> states) {
    _excludedConversationStates = states;
  }

  LMChatClient build() {
    return LMChatClient._(
      excludedConversationStates: _excludedConversationStates,
      sdkCallback: _sdkCallback!,
    );
  }
}
