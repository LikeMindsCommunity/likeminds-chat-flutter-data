---
sidebar_position: 9
title: Delete Reaction
---

# Delete Reaction

You can integrate "remove reaction" which enables your user to remove their reaction from already reacted chat messages. You can do so by following the given steps.

## Steps to Delete Reaction in a Conversation

1. Create an object of the `DeleteReactionRequest` class, using the `DeleteReactionRequestBuilder` class.
2. For deleting reaction from a conversation call `deleteReaction()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<DeleteReactionResponse>`) as per your requirement.

```dart
DeleteReactionRequest request = (DeleteReactionRequestBuilder()
    ..conversationId(70989)
    ..reaction("😂")).build();

LMResponse<DeleteReactionResponse> response =
    await lmChatClient.deleteReaction(request);

if (response.success) {
    // your function to process the response data
    processResponse(response);
} else {
    // your function to process error message
    processError(response);
}
```

## Models

### DeleteReactionRequest

List of parameters for the `DeleteReactionRequest` class

| Variable       | Type   | Description     | Optional |
| -------------- | ------ | --------------- | -------- |
| conversationId | int    | Conversation Id |          |
| reaction       | String | Reaction        |          |

### DeleteReactionResponse

List of parameters for the `DeleteReactionResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
