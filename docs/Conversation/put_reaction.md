---
sidebar_position: 8
title: Put Reaction
---

# Put Reaction

Reactions are used to add context to a message, such as by indicating that the user agree or disagree with something that was said. You can integrate reactions to react to chat messages and enable your users to react to these messages by following the given steps

## Steps to Put Reaction from a Conversation

1. Create an object of the `PutReactionRequest` class, using the `PutReactionRequestBuilder` class.
2. For putting reaction in a conversation call `putReaction()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<PutReactionResponse>`) as per your requirement.

```dart
PutReactionRequest request = (PutReactionRequestBuilder()
    ..conversationId(70989)
    ..reaction("😂")).build();

LMResponse<PutReactionResponse> response =
    await lmChatClient.putReaction(request);

if (response.success) {
    // your function to process the response data
    processResponse(response);
} else {
    // your function to process error message
    processError(response);
}
```

## Models

### PutReactionRequest

List of parameters for the `PutReactionRequest` class

| Variable       | Type   | Description     | Optional |
| -------------- | ------ | --------------- | -------- |
| conversationId | int    | Conversation Id |          |
| reaction       | String | Reaction        |          |

### PutReactionResponse

List of parameters for the `PutReactionResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
