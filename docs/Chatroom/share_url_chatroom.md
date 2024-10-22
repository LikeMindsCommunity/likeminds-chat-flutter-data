---
sidebar_position: 7
title: Share Chatroom
---

# Share Chatroom

Sharing a chatroom with other users is made simple with LikeMinds Flutter Chat SDK. You can generate a shareable URL for the chatroom and distribute it to other users. This allows them to join the chatroom and participate in the conversations. Seamlessly connect and collaborate with others.

## Steps to Share a Chatroom

1. Create an object of the `ShareChatroomUrlRequest` class using the `ShareChatroomRequestBuilder` class.
2. For sharing a chatroom call `shareChatroomUrl()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<ShareChatroomUrlResponse>`) as per your requirement.

```dart
final LMChatClient lmClient = ...;

ShareChatroomRequest request = (
    ShareChatroomRequestBuilder()
          ..chatroomId(70989)
          ..domain("https://www.likeminds.ai")
).build();

LMResponse<ShareChatroomResponse> response =
    await lmChatClient.shareChatroomUrl(request);

if (response.success) {
    // your function to process the response data
   processResponse(response);
} else {
   // your function to process error message
   processError(response);
}
```

## Models

### ShareChatroomUrlRequest

List of parameters for the `ShareChatroomUrlRequest` class

| Variable   | Type   | Description | Optional |
| ---------- | ------ | ----------- | -------- |
| chatroomId | int    | Chatroom Id |          |
| domain     | String | Domain name |          |

### ShareChatroomUrlResponse

List of parameters for the `ShareChatroomUrlResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
