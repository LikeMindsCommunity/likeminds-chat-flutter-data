---
sidebar_position: 8
title: Mark Read Chatroom
---

# Mark Read Chatroom

Marking a chatroom as read with LikeMinds Flutter Chat SDK allows you to control your notification preferences for that specific chatroom.

## Steps to Mark a Chatroom as Read

1. Create an object of the `MarkReadChatroomRequest` class.
2. For marking a chatroom as read call `markReadChatroom()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<MarkReadChatroomResponse>`) as per your requirement.

```dart
MarkReadChatroomRequest request = (MarkReadChatroomRequestBuilder()
                        ..chatroomId(70989)).build();

LMResponse<MarkReadChatroomResponse> response =
    await lmChatClient.markReadChatroom(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
    // your function to process error message
   processError(response);
}
```

## Models

### MarkReadChatroomRequest

List of parameters for the `MarkReadChatroomRequest` class

| Variable   | Type | Description | Optional |
| ---------- | ---- | ----------- | -------- |
| chatroomId | int  | Chatroom Id |          |

### MarkReadChatroomResponse

List of parameters for the `MarkReadChatroomResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
