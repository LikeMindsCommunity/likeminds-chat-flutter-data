---
sidebar_position: 2
title: Join Chatroom
---

# Join Chatroom

Joining a chatroom with LikeMinds Flutter Chat SDK allows you to receive timely notifications for all conversations happening within that chatroom.Experience real-time engagement and never miss out on any important conversations by joining the chatroom using LikeMinds Flutter Chat SDK.

## Steps to follow a chatroom

1. Create an object of the `FollowChatroomRequest` class, pass `true` to value.
2. For following a chatroom call `followChatroom()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<FollowChatroomResponse>`) as per your requirement.

```dart
// To leave a chatroom, set the value to false
FollowChatroomRequest request = (FollowChatroomRequestBuilder()
                      ..chatroomId(70989)
                      ..memberId(87103)
                      ..value(true)).build();

LMResponse<FollowChatroomResponse> response =
    await lmChatClient.followChatroom(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
  // your function to process error message
   processError(response);
}
```

## Models

### FollowChatroomRequest

List of parameters for the `FollowChatroomRequest` class

| Variable   | Type | Description  | Optional           |
| ---------- | ---- | ------------ | ------------------ |
| chatroomId | int  | Chatroom Id  |                    |
| memberId   | int  | Member Id    | :heavy_check_mark: |
| value      | bool | Follow value |                    |

### FollowChatroomResponse

List of parameters for the `FollowChatroomResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
