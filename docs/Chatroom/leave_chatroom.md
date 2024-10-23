---
sidebar_position: 3
title: Leave Chatroom
---

# Leave Chatroom

Leaving a chatroom with LikeMinds Flutter Chat SDK allows you to exit a chatroom that you no longer want to be a part of.

## Steps to Leave a Chatroom for open ChatRoom

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



## Steps to Leave a Chatroom for secret ChatRoom

1. Create an object of the `DeleteParticipantRequest` class.
2. Call the `deleteParticipant()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<DeleteParticipantResponse>`) as per your requirement.

### Example for Secret Chatroom

When deleting a participant from a secret chatroom, ensure that the `isSecret` parameter is set to `true`.

```dart
DeleteParticipantRequest request = (DeleteParticipantRequestBuilder()
                    ..chatroomId(70989)
                    ..isSecret(true)
                    ..memberId('member123')).build();

LMResponse<DeleteParticipantResponse> response = await lmChatClient.deleteParticipant(request);

if (response.success) {
  // your function to handle successful deletion
  handleDeleteSuccess();
} else {
  // your function to handle deletion error
  handleDeleteError(response.errorMessage);
}
````

## Models

### DeleteParticipantRequest

List of parameters for the `DeleteParticipantRequest` class

| Variable    | Type                  | Description                      | Optional           |
| ----------- | --------------------- | -------------------------------- | ------------------ |
| chatroomId  | int                   | Unique ID of the chatroom       |                    |
| isSecret    | bool?                 | Indicates if the chatroom is secret | :heavy_check_mark: |
| memberId    | String?              | Unique ID of the member to be deleted |                    |
