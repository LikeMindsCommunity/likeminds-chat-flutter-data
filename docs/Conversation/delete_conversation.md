---
sidebar_position: 6
title: Delete Conversation
---

# Delete Conversation

Deleting a conversation means that you can delete the text content of specified conversations corresponding to unique conversation IDs.

## Steps to Delete a Conversation

1. Create an object of the `DeleteConversationRequest` class using the `DeleteConversationRequestBuilder` class and specify the conversation IDs.
2. Call `deleteConversation()` present in the `LMChatClient` class using your request object.
3. Process the response (`LMResponse<DeleteConversationResponse>`) as per your requirement.

### Example Usage

```dart
DeleteConversationRequest request = (DeleteConversationRequestBuilder()
          ..conversationIds([273099])
          ..reason("User requested deletion"))
    .build();

LMResponse<DeleteConversationResponse> response =
    await lmClient.deleteConversation(request);

if (response.success) {
    // your function to process the response data
    processResponse(response);
} else {
    // your function to process error message
    processError(response.errorMessage);
}
```

## Models

### DeleteConversationRequest

List of parameters for the `DeleteConversationRequest` class

| Variable        | Type        | Description                      | Optional |
| --------------- | ----------- | -------------------------------- | -------- |
| conversationIds | List<int\>   | List of conversation IDs         |          |
| reason          | String      | Reason for conversation deletion  |          |

### DeleteConversationResponse

List of parameters for the `DeleteConversationResponse` class

| Variable      | Type                  | Description                      | Optional           |
| ------------- | --------------------- | -------------------------------- | ------------------ |
| conversations | List<[Conversation](common_models.md/#conversation)\>? | List of conversation objects     | :heavy_check_mark: |
