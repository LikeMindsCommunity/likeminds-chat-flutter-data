---
sidebar_position: 3
title: Leave Chatroom
---

# Leave Chatroom

Leaving a chatroom with LikeMinds Flutter Chat SDK allows you to exit a chatroom that you no longer want to be a part of.

## Steps to Leave a Chatroom for open ChatRoom

1. Create an object of the `FollowChatroomRequest` class, pass `false` to value.
2. For following a chatroom call `followChatroom()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<FollowChatroomResponse>`) as per your requirement.

```dart
// To leave a chatroom, set the value to false
FollowChatroomRequest request =  (FollowChatroomRequestBuilder()
                      ..chatroomId(70989)
                      ..memberId(87103)
                      ..value(false)).build();

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

## Steps to Leave a Chatroom for secret ChatRoom

1. Create an object of the `DeleteParticipantRequest` class using the `DeleteParticipantRequestBuilder` class.
2. Using the request, call the `deleteParticipant()` method present in the `LMChatClient` class.
3. Process the response (`LMResponse<DeleteParticipantResponse>`) as per your requirement.

```dart
final DeleteParticipantRequest request = (DeleteParticipantRequestBuilder()
                ..chatroomId(widget.chatroom.id)
                ..isSecret(true))
              .build();

LMResponse<DeleteParticipantResponse> response = await lmChatClient.deleteParticipant(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
  // your function to process error message
   processError(response);
}
```

## Models

### DeleteParticipantRequest

List of parameters for the `DeleteParticipantRequest` class

| Variable   | Type | Description                            | Optional           |
| ---------- | ---- | -------------------------------------- | ------------------ |
| chatroomId | int  | Chatroom Id                            |                    |
| isSecret   | bool | Set to true in case of secret chatroom | :heavy_check_mark: |

### DeleteParticipantResponse

List of parameters for the `DeleteParticipantResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
