---
sidebar_position: 5
title: Edit Conversation
---

# Edit Conversation


Editing a conversation means that you can change the text content of specified conversation corresponding to a unique conversation ID.

## Steps to edit a conversation

1. Create an object of the `EditConversationRequest` class, using the `EditConversationRequestBuilder` class.
2. For editing a conversation call `editConversation()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<EditConversationResponse>`) as per your requirement.

```dart
EditConversationRequest request = (EditConversationRequestBuilder()
    ..conversationId(70989)
    ..text("Hello World"))
.build();

LMResponse<EditConversationResponse> response =
    await lmChatClient.editConversation(request);

if (response.success) {
    // your function to process the response data
   processResponse(response);
} else {
    // your function to process error message
   processError(response);
}
```

## Models

### EditConversationRequest

List of parameters for the `EditConversationRequest` class

| Variable       | Type   | Description     | Optional |
| -------------- | ------ | --------------- | -------- |
| conversationId | int    | Conversation Id |          |
| text           | String | Text content    |          |

### EditConversationResponse

List of parameters for the `EditConversationResponse` class

| Variable     | Type          | Description                      | Optional           |
| ------------ | ------------- | -------------------------------- | ------------------ |
| success      | bool          | API success status               |                    |
| errorMessage | String?       | Error message in case of failure | :heavy_check_mark: |
| conversation | Conversation? | Edited conversation              | :heavy_check_mark: |
