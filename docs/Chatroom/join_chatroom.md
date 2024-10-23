---
sidebar_position: 2
title: Join Chatroom
---

# Join Chatroom

Joining a chatroom with LikeMinds Flutter Chat SDK allows you to receive timely notifications for all conversations happening within that chatroom.Experience real-time engagement and never miss out on any important conversations by joining the chatroom using LikeMinds Flutter Chat SDK.

## Steps to Follow a Chatroom

1. Create an object of the `FollowChatroomRequest` class.
2. Call the `followChatroom()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<FollowChatroomResponse>`) as per your requirement.

```dart
// To leave a chatroom, set the value to false
FollowChatroomRequest request = (FollowChatroomRequestBuilder()
                      ..chatroomId(70989)
                      ..memberId(87103)
                      ..value(true)).build();

LMResponse<FollowChatroomResponse> response = await lmChatClient.followChatroom(request);

if (response.success) {
  // your function to handle successful follow action
  handleFollowSuccess();
} else {
  // your function to handle follow error
  handleFollowError(response.errorMessage);
}
```

## Models

### FollowChatroomRequest

List of parameters for the `FollowChatroomRequest` class

| Variable    | Type   | Description                      | Optional           |
| ----------- | ------ | -------------------------------- | ------------------ |
| chatroomId  | int    | Unique ID of the chatroom       |                    |
| memberId    | int?   | Unique ID of the member | :heavy_check_mark: |
| value       | bool   | Set to `true` to follow, `false` to unfollow |                    |

