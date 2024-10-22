---
sidebar_position: 6
title: Delete Conversation
---

# Delete Conversation


Deleting a conversation means that you can delete the text content of specified conversation corresponding to a unique conversation ID.

## Steps to delete a conversation

1. Create an object of the `DeleteConversationRequest` class using the `DeleteConversationRequestBuilder` class and specify the conversation ID.
2. For deleting a conversation call `deleteConversation()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<DeleteConversationResponse>`) as per your requirement.

```dart
final LMChatClient lmClient = ...;

DeleteConversationRequest request = (DeleteConversationRequestBuilder()
          ..conversationId(273099))
    .build();

LMResponse<DeleteConversationResponse> response =
    await lmClient.deleteConversation(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
    // your function to process error message
   processError(response);
}
```

## Models

### DeleteConversationRequest

List of parameters for the `DeleteConversationRequest` class

| Variable        | Type        | Description                      | Optional |
| --------------- | ----------- | -------------------------------- | -------- |
| conversationIds | List<int\> | Conversations Ids                |          |
| reason          | String      | Reason for conversation deletion |          |

### DeleteConversationResponse

List of parameters for the `DeleteConversationResponse` class

| Variable      | Type                  | Description                      | Optional           |
| ------------- | --------------------- | -------------------------------- | ------------------ |
| success       | bool                  | API success status               |                    |
| errorMessage  | String?               | Error message in case of failure | :heavy_check_mark: |
| conversations | `List<Conversation>?` | List of conversation objects     | :heavy_check_mark: |
