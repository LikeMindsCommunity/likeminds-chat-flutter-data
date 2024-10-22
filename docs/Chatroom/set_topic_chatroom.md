---
sidebar_position: 5
title: Set Topic Chatroom
---

# Set Topic Chatroom

With LikeMinds Flutter Chat SDK, you have the ability to set a topic for a chatroom. This feature allows you to categorize and organize discussions, making it easier for participants to understand the purpose or theme of the chatroom.

## Steps to share a chatroom

1. Create an object of the `SetTopicChatroomRequest` class using the `SetTopicChatroomRequestBuilder` class and specify the chatroom ID and the topic.
2. For setting a topic for a chatroom call `setTopicChatroom()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<SetTopicChatroomResponse>`) as per your requirement.

```dart
SetChatroomTopicRequest request = (SetChatroomTopicRequestBuilder()
          ..chatroomId(70989)
          ..conversationId(273099))
        .build();

LMResponse<SetChatroomTopicResponse> response =
    await lmChatClient.setTopicChatroom(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
   // your function to process error message
   processError(response);
}
```

## Models

### SetTopicChatroomRequest

List of parameters for the `SetTopicChatroomRequest` class

| Variable       | Type | Description     | Optional |
| -------------- | ---- | --------------- | -------- |
| chatroomId     | int  | Chatroom Id     |          |
| conversationId | int  | Conversation Id |          |

### SetTopicChatroomResponse

List of parameters for the `SetTopicChatroomResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
