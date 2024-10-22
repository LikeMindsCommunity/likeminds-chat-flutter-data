---
sidebar_position: 4
title: Mute Chatroom
---

# Mute Chatroom

Muting a chatroom in LikeMinds Flutter Chat SDK ensures that you won't receive any notifications for new posts within that chatroom. This feature allows you to customize your notification preferences and avoid interruptions when you don't wish to be notified of new messages.

## Steps to Mute a Chatroom

1. Create an object of the `MuteChatroomRequest` class.
2. For muting a chatroom call `muteChatroom()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<MuteChatroomResponse>`) as per your requirement.

```dart
MuteChatroomRequest request = (MuteChatroomRequestBuilder()
                    ..chatroomId(70989)
                    ..value(true)).build();

LMResponse<MuteChatroomResponse> response =
    await lmChatClient.muteChatroom(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
   // your function to process error message
   processError(response);
}
```

## Models

### MuteChatroomRequest

List of parameters for the `MuteChatroomRequest` class

| Variable   | Type | Description | Optional |
| ---------- | ---- | ----------- | -------- |
| chatroomId | int  | Chatroom Id |          |
| value      | bool | Mute value  |          |

### MuteChatroomResponse

List of parameters for the `MuteChatroomResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
