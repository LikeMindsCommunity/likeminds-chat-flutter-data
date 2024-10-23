---
sidebar_position: 5
title: Set Topic Chatroom
---

# Set Topic Chatroom

With LikeMinds Flutter Chat SDK, you have the ability to set a topic for a chatroom. This feature allows you to categorize and organize discussions, making it easier for participants to understand the purpose or theme of the chatroom.

## Steps to Set a Chatroom Topic

1. Create an object of the `SetChatroomTopicRequest` class.
2. Call the `setChatroomTopic()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<SetChatroomTopicResponse>`) as per your requirement.

### Example Usage

```dart
SetChatroomTopicRequest request = (SetChatroomTopicRequestBuilder()
                    ..chatroomId(70989)
                    ..conversationId(273099)).build();

LMResponse<SetChatroomTopicResponse> response = await lmChatClient.setChatroomTopic(request);

if (response.success) {
  // your function to handle successful topic setting
  handleSetTopicSuccess();
} else {
  // your function to handle error in setting topic
  handleSetTopicError(response.errorMessage);
}
```

## Models

### SetChatroomTopicRequest

List of parameters for the `SetChatroomTopicRequest` class

| Variable         | Type   | Description                      | Optional           |
| ---------------- | ------ | -------------------------------- | ------------------ |
| chatroomId       | int    | Unique ID of the chatroom       |                    |
| conversationId    | int    | Unique ID of the conversation    |                    |
