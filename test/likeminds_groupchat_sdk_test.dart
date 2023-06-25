// ignore_for_file: constant_identifier_names, non_constant_identifier_names
@Timeout(Duration(seconds: 600))

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

import 'environment/test_env.dart';
import 'test_callback.dart';

const bool TESTING_PROD_FLAG = bool.fromEnvironment('DEBUG');

final TestCallback TESTING_CALLBACK = TestCallback();

final String TESTING_BETA_API_KEY = EnvTest.testingBetaAPIKey;
final String TESTING_BETA_BOT_ID = EnvTest.testingBetaBotID;
const int TESTING_BETA_DEFAULT_CHATROOM = EnvTest.testingBetaDefaultChatroom;

final String TESTING_PROD_API_KEY = EnvTest.testingProdAPIKey;
final String TESTING_PROD_BOT_ID = EnvTest.testingProdBotID;
const int TESTING_PROD_DEFAULT_CHATROOM = EnvTest.testingProdDefaultChatroom;

void main() {
  debugPrint("Starting the tests now...");
  int? conversationId;
  int chatroomId = TESTING_PROD_FLAG
      ? TESTING_PROD_DEFAULT_CHATROOM
      : TESTING_BETA_DEFAULT_CHATROOM;

  // Initiate the SDK
  LMChatClient lmClient = (LMChatClientBuilder()
        ..apiKey(
            TESTING_PROD_FLAG ? TESTING_PROD_API_KEY : TESTING_BETA_API_KEY)
        ..sdkCallback(TESTING_CALLBACK))
      .build();

  /// Test the login method
  /// This test will fail if the user can not log in
  test('Initiating the chat SDK, and login the user', () async {
    debugPrint("Initiating login test...");
    InitiateUserRequest request = (InitiateUserRequestBuilder()
          ..userId(
              TESTING_PROD_FLAG ? TESTING_PROD_BOT_ID : TESTING_BETA_BOT_ID))
        .build();
    LMResponse<InitiateUserResponse> response =
        await lmClient.initiateUser(request);
    debugPrint("Logged in as, ${response.data?.initiateUser?.user.name}");

    // TESTING_CALLBACK.eventFiredCallback();
    expect(response.success, true);
  });

  /// Test the get home feed method
  /// This test will fail if the user can not get the home feed
  test('Getting the home feed test', () async {
    debugPrint("Initiating home feed test...");
    GetHomeFeedRequest request = (GetHomeFeedRequestBuilder()
          ..page(1)
          ..pageSize(10))
        .build();

    LMResponse<GetHomeFeedResponse> response =
        await lmClient.getHomeFeed(request);
    debugPrint("Got ${response.data?.chatroomsData?.length} chatrooms");
    expect(response.success, true);
  });

  /// Test the get explore tab count method
  /// This test will fail if the user can not get the explore tab count
  test('Getting the explore tab count test', () async {
    debugPrint("Initiating explore tab count test...");
    LMResponse<GetExploreTabCountResponse> response =
        await lmClient.getExploreTabCount();
    debugPrint(
        "Got ${response.data?.totalChannelCount} chatrooms, out of which ${response.data?.unseenChannelCount} are unseen");
    expect(response.success, true);
  });

  /// Test the get explore feed method
  /// This test will fail if the user can not get the explore feed
  test('Getting the explore feed test', () async {
    debugPrint("Initiating explore feed test...");
    GetExploreFeedRequest request = (GetExploreFeedRequestBuilder()
          ..page(1)
          ..orderType(0)
          ..pinned(false))
        .build();

    LMResponse<GetExploreFeedResponse> response =
        await lmClient.getExploreFeed(request);
    debugPrint("Got ${response.data?.chatrooms?.length} chatrooms");
    expect(response.success, true);
  });

  /// Test the get chatroom method
  /// This test will fail if the user can not get the chatroom
  test('Getting the chatroom test', () async {
    debugPrint("Initiating chatroom test...");
    GetChatroomRequest request =
        (GetChatroomRequestBuilder()..chatroomId(chatroomId)).build();
    LMResponse<GetChatroomResponse> response =
        await lmClient.getChatroom(request);
    debugPrint("Got ${response.data?.chatroom?.header} chatroom");
    expect(response.success, true);
  });

  /// Test the follow chatroom method
  /// This test will fail if the user can not follow the chatroom
  test('Following the chatroom test', () async {
    debugPrint("Initiating follow chatroom test...");
    FollowChatroomRequest request = (FollowChatroomRequestBuilder()
          ..chatroomId(chatroomId)
          ..memberId(87103)
          ..value(true))
        .build();

    LMResponse<FollowChatroomResponse> response =
        await lmClient.followChatroom(request);
    debugPrint("Followed chatroom with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the mute chatroom method
  /// This test will fail if the user can not mute the chatroom
  test('Muting the chatroom test', () async {
    debugPrint("Initiating mute chatroom test...");
    MuteChatroomRequest request = (MuteChatroomRequestBuilder()
          ..chatroomId(chatroomId)
          ..value(true))
        .build();
    LMResponse<MuteChatroomResponse> response =
        await lmClient.muteChatroom(request);
    debugPrint("Muted chatroom with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the mark read chatroom method
  /// This test will fail if the user can not mark read the chatroom
  test('Marking read the chatroom test', () async {
    debugPrint("Initiating mark read chatroom test...");
    MarkReadChatroomRequest request =
        (MarkReadChatroomRequestBuilder()..chatroomId(chatroomId)).build();
    LMResponse<MarkReadChatroomResponse> response =
        await lmClient.markReadChatroom(request);
    debugPrint("Marked read chatroom with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the share chatroom method
  /// This test will fail if the user can not share the chatroom
  test('Sharing the chatroom test', () async {
    debugPrint("Initiating share chatroom test...");
    ShareChatroomRequest request = (ShareChatroomRequestBuilder()
          ..chatroomId(chatroomId)
          ..domain("https://www.likeminds.ai"))
        .build();
    LMResponse<ShareChatroomResponse> response =
        await lmClient.shareChatroomUrl(request);
    debugPrint("Shared chatroom with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the set chatroom topic method
  /// This test will fail if the user can not set the chatroom topic
  test('Setting the chatroom topic test', () async {
    debugPrint("Initiating set chatroom topic test...");
    SetChatroomTopicRequest request = (SetChatroomTopicRequestBuilder()
          ..chatroomId(chatroomId)
          ..conversationId(273099))
        .build();
    LMResponse<SetChatroomTopicResponse> response =
        await lmClient.setChatroomTopic(request);
    debugPrint("Set chatroom topic with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the get conversation method
  /// This test will fail if the user can not get the conversation
  test('Getting the conversation test', () async {
    debugPrint("Initiating get conversation test...");
    GetConversationRequest request = (GetConversationRequestBuilder()
          ..chatroomId(chatroomId)
          ..page(1)
          ..pageSize(100)
          ..maxTimestamp(DateTime.now().millisecondsSinceEpoch)
          ..minTimestamp(0))
        .build();
    LMResponse<GetConversationResponse> response =
        await lmClient.getConversation(request);
    debugPrint(
        "Got conversations in the quantity of ${response.data!.conversationData!.length}");
    expect(response.success, true);
  });

  /// Test the post conversation method
  /// This test will fail if the user can not post the conversation
  test('Posting the conversation test', () async {
    debugPrint("Initiating post conversation test...");
    int tempId = DateTime.now().millisecondsSinceEpoch;
    PostConversationRequest request = (PostConversationRequestBuilder()
          ..chatroomId(chatroomId)
          ..text("This is a test message from the SDK")
          ..temporaryId(tempId.toString())
          ..expiryTime(0))
        .build();
    LMResponse<PostConversationResponse> response =
        await lmClient.postConversation(request);
    //Save the conversation ID for the next test
    conversationId = response.data!.id;
    debugPrint(
      "Posted conversation with ID ${response.data!.id} and text \"${response.data!.conversation?.answer}\"",
    );
    expect(response.success, true);
  });

  /// Test the get single conversation method
  /// This test will fail if the user can not get the conversation
  test('Getting the conversation test', () async {
    debugPrint("Initiating get single conversation test...");
    int maxTimestamp = DateTime.now().millisecondsSinceEpoch;
    GetConversationRequest request = (GetConversationRequestBuilder()
          ..chatroomId(chatroomId)
          ..page(1)
          ..isLocalDB(false)
          ..pageSize(200)
          ..minTimestamp(0)
          ..maxTimestamp(maxTimestamp)
          ..conversationId(conversationId!))
        .build();
    LMResponse<GetConversationResponse> response =
        await lmClient.getConversation(request);
    debugPrint(
        "Got single conversation ${response.data!.conversationData?.first.toEntity().toJson()}");
    expect(response.success, true);
  });

  /// Test the edit conversation method
  /// This test will fail if the user can not edit the conversation
  test('Editing the conversation test', () async {
    debugPrint("Initiating edit conversation test...");
    EditConversationRequest request = (EditConversationRequestBuilder()
          ..conversationId(conversationId ?? 0)
          ..text("This is an edited test message from the SDK"))
        .build();
    LMResponse<EditConversationResponse> response =
        await lmClient.editConversation(request);
    debugPrint(
      "Edited conversation with ID ${response.data!.conversation?.id} and text is now \"${response.data!.conversation?.answer}\"",
    );
    expect(response.success, true);
  });

  /// Test the delete conversation method
  /// This test will fail if the user can not delete the conversation
  test('Deleting the conversation test', () async {
    debugPrint("Initiating delete conversation test...");
    DeleteConversationRequest request = (DeleteConversationRequestBuilder()
          ..conversationIds([conversationId ?? 0])
          ..reason("Because testing demands you to"))
        .build();
    LMResponse<DeleteConversationResponse> response =
        await lmClient.deleteConversation(request);
    debugPrint(
        "Deleted conversation with IDs ${response.data!.conversations?.map((e) => e.id).toList()}");
    expect(response.success, true);
  });

  // Test the get participants methods
  // This test will fail if the user can't the list of participants
  test('Fetch participants test', () async {
    debugPrint("Initiating Fetch participants test...");
    GetParticipantsRequest request = (GetParticipantsRequestBuilder()
          ..chatroomId(chatroomId)
          ..page(1)
          ..pageSize(10)
          ..search(null)
          ..isSecret(false))
        .build();
    LMResponse<GetParticipantsResponse> response =
        await lmClient.getParticipants(request);
    debugPrint(
        "List of participants ${response.data!.participants.toString()}");
    expect(response.success, true);
  });

  // Test the decode URL methods
  // This test will fail if the user can't decode a URL
  test('Decode URL test', () async {
    debugPrint("Initiating decode URL test...");
    DecodeUrlRequest request = (DecodeUrlRequestBuilder()
          ..url("https://likeminds.community/"))
        .build();
    LMResponse<DecodeUrlResponse> response = await lmClient.decodeUrl(request);
    debugPrint("Decoded URL ${response.data!.ogTags.toString()}");
    expect(response.success, true);
  });

  // Test the member rights methods
  // This test will fail if the user can't fetch member rights
  test('Fetch Member Rights test', () async {
    debugPrint("Initiating Fetch Member Rights test...");
    LMResponse<MemberStateResponse> response = await lmClient.getMemberState();
    debugPrint("Member State for User with ID ${response.data!.member!.id}");
    expect(response.success, true);
  });

  // / Test the logout method
  // / This test will fail if the user can not log out
  test('Logging out the user', () async {
    LogoutRequest request = (LogoutRequestBuilder()).build();
    LMResponse<LogoutResponse> response = await lmClient.logout(request);
    if (response.success) {
      debugPrint("Successfully logged out after all tests");
    }
    expect(response.success, true);
  });
}
