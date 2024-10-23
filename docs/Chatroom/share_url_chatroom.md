---
sidebar_position: 7
title: Share Chatroom
---

# Share Chatroom

Sharing a chatroom with other users is made simple with LikeMinds Flutter Chat SDK. You can generate a shareable URL for the chatroom and distribute it to other users. This allows them to join the chatroom and participate in the conversations. Seamlessly connect and collaborate with others.

## Steps to Share a Chatroom

1. Create an object of the `ShareChatroomRequest` class.
2. Call the `shareChatroom()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<ShareChatroomResponse>`) as per your requirement.

### Example Usage

```dart
ShareChatroomRequest request = (ShareChatroomRequestBuilder()
                    ..chatroomId(70989)
                    ..domain("https://www.example.com")).build();

LMResponse<ShareChatroomResponse> response = await lmChatClient.shareChatroom(request);

if (response.success) {
  // your function to handle successful sharing
  handleShareSuccess();
} else {
  // your function to handle share error
  handleShareError(response.errorMessage);
}
```

## Models

### ShareChatroomRequest

List of parameters for the `ShareChatroomRequest` class

| Variable    | Type   | Description                      | Optional           |
| ----------- | ------ | -------------------------------- | ------------------ |
| chatroomId  | int    | Unique ID of the chatroom       |                    |
| domain      | String | Domain name for the shareable link |                    |

