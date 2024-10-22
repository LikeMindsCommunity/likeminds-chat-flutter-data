---
sidebar_position: 2
title: Get Conversation
---

# Get Conversation

LikeMinds Flutter Chat SDK offers this feature which enables you to access and analyze individual conversations, empowering you to implement customized functionalities or perform specific operations within your chat application.

## Steps to Get a Single Conversation

1. Create an object of the `GetSingleConversationRequest` class using the `GetSingleConversationRequestBuilder` class and specify the conversation ID.
2. For getting a single conversation call `getSingleConversation()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<GetSingleConversationResponse>`) as per your requirement.

```dart
GetSingleConversationRequest request = (GetSingleConversationRequestBuilder()
          ..conversationId(273099))
        .build();

LMResponse<GetSingleConversationResponse> response =
    await lmChatClient.getSingleConversation(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
   // your function to process error message
   processError(response);
}
```

## Models

### GetSingleConversationRequest

List of parameters for the `GetSingleConversationRequest` class

| Variable       | Type | Description     | Optional |
| -------------- | ---- | --------------- | -------- |
| conversationId | int  | Conversation Id |          |
| chatroomId     | int  | Chatroom Id     |          |

### GetSingleConversationResponse

List of parameters for the `GetSingleConversationResponse` class

| Variable     | Type          | Description                      | Optional           |
| ------------ | ------------- | -------------------------------- | ------------------ |
| success      | bool          | API success status               |                    |
| errorMessage | String?       | Error message in case of failure | :heavy_check_mark: |
| conversation | Conversation? | Conversation object              | :heavy_check_mark: |
