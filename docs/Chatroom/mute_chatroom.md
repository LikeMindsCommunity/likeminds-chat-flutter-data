---
sidebar_position: 4
title: Mute Chatroom
---

# Mute Chatroom

Muting a chatroom in LikeMinds Flutter Chat SDK ensures that you won't receive any notifications for new posts within that chatroom. This feature allows you to customize your notification preferences and avoid interruptions when you don't wish to be notified of new messages.

## Steps to Mute a Chatroom

1. Create an object of the `MuteChatroomRequest` class.
2. Call the `muteChatroom()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<MuteChatroomResponse>`) as per your requirement.

### Example Usage

```dart
MuteChatroomRequest request = (MuteChatroomRequestBuilder()
                    ..chatroomId(70989)
                    ..value(true)).build();

LMResponse<MuteChatroomResponse> response = await lmChatClient.muteChatroom(request);

if (response.success) {
  // your function to handle successful muting
  handleMuteSuccess();
} else {
  // your function to handle mute error
  handleMuteError(response.errorMessage);
}
```

## Models

### MuteChatroomRequest

List of parameters for the `MuteChatroomRequest` class

| Variable    | Type   | Description                      | Optional           |
| ----------- | ------ | -------------------------------- | ------------------ |
| chatroomId  | int    | Unique ID of the chatroom       |                    |
| value       | bool   | Set to `true` to mute, `false` to unmute |                    |
