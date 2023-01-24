import 'package:flutter_test/flutter_test.dart';

import 'package:likeminds_groupchat/likeminds_groupchat.dart';
import 'package:likeminds_groupchat/src/methods/auth.dart';

void main() {
  test('test for checking user initialization success', () async {
    final LikeMindsGroupChat likeMindsGroupChat = LikeMindsGroupChat();
    SdkApplication sdkApplication = likeMindsGroupChat.initiateLikeMinds();
    AuthApi authApi = sdkApplication.getAuthApi();

    final InitiateUserRequest initiateUserRequest = InitiateUserRequest(
        userId: "divyansh-test-sdk-1",
        userName: "Divyansh Gandhi SDK",
        isGuest: false,
        apiKey: "bad53fff-c85a-4098-b011-ac36703cc98b");
    InitiateUserResponse initiateUserResponse =
        await authApi.initiateUser(initiateUserRequest);
    print(initiateUserResponse.data!.toString());
    expect(initiateUserResponse.success, true);
  });
}
