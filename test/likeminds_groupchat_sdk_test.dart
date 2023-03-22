// ignore_for_file: constant_identifier_names, non_constant_identifier_names
@Timeout(Duration(seconds: 600))

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

import 'test_callback.dart';

final TestCallback TESTING_CALLBACK = TestCallback();
const String TESTING_API_KEY = "bad53fff-c85a-4098-b011-ac36703cc98b";
const String TESTING_BOT_ID = "22b6a64f-66bf-4bca-800e-b40ca66f924d";
const String TESTING_USER_ID = "fa9dd395-873b-4493-9e81-12dfdced9345";

void main() {
  debugPrint("Starting the tests now...");

  // Initiate the SDK
  LMChatClient lmClient = LMChatClient.initiateLikeMinds(
    apiKey: TESTING_API_KEY,
    sdkCallback: TESTING_CALLBACK,
  );

  /// Test the login method
  /// This test will fail if the user can not log in
  test('Initiating the chat SDK, and login the user', () async {
    debugPrint("Initiating login test...");
    InitiateUserRequest request = InitiateUserRequest(userId: TESTING_BOT_ID);
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
    GetHomeFeedRequest request = GetHomeFeedRequest(
      page: 1,
      pageSize: 10,
    );
    LMResponse<GetHomeFeedResponse> response =
        await lmClient.getHomeFeed(request);
    debugPrint("Got ${response.data?.myChatRooms?.length} chatrooms");
    expect(response.success, true);
  });

  /// Test the get chatroom method
  /// This test will fail if the user can not get the chatroom
  test('Getting the chatroom test', () async {
    debugPrint("Initiating chatroom test...");
    GetChatroomRequest request = GetChatroomRequest(chatroomId: 70989);
    LMResponse<GetChatroomResponse> response =
        await lmClient.getChatroom(request);
    debugPrint("Got ${response.data?.chatroom?.header} chatroom");
    expect(response.success, true);
  });

  /// Test the follow chatroom method
  /// This test will fail if the user can not follow the chatroom
  test('Following the chatroom test', () async {
    debugPrint("Initiating follow chatroom test...");
    FollowChatroomRequest request = FollowChatroomRequest(
      chatroomId: 70989,
      value: true,
    );
    LMResponse<FollowChatroomResponse> response =
        await lmClient.followChatroom(request);
    debugPrint("Followed chatroom with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the mute chatroom method
  /// This test will fail if the user can not mute the chatroom
  test('Muting the chatroom test', () async {
    debugPrint("Initiating mute chatroom test...");
    MuteChatroomRequest request = MuteChatroomRequest(
      chatroomId: 70989,
      value: true,
    );
    LMResponse<MuteChatroomResponse> response =
        await lmClient.muteChatroom(request);
    debugPrint("Muted chatroom with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the mark read chatroom method
  /// This test will fail if the user can not mark read the chatroom
  test('Marking read the chatroom test', () async {
    debugPrint("Initiating mark read chatroom test...");
    MarkReadChatroomRequest request = MarkReadChatroomRequest(
      chatroomId: 70989,
    );
    LMResponse<MarkReadChatroomResponse> response =
        await lmClient.markReadChatroom(request);
    debugPrint("Marked read chatroom with ID ${request.chatroomId}");
    expect(response.success, true);
  });

  /// Test the logout method
  /// This test will fail if the user can not log out
  // test('Logging out the user', () async {
  //   LogoutRequest request = LogoutRequest(refreshToken: TESTING_USER_ID);
  //   LogoutResponse response = await lmClient.logout(request);
  //   if (response.success) {
  //     debugPrint("Successfully logged out");
  //   }
  //   expect(response.success, true);
  // });
}
