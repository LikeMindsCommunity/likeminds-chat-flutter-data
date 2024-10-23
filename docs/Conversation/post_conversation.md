---
sidebar_position: 3
title: Post Conversation
---

# Post Conversation

LikeMinds Flutter Chat SDK allows you to conveniently post a conversation in an existing chatroom by specifying the chatroom ID. This powerful feature enables you to contribute to ongoing discussions, share important information, or engage with other participants in real-time.

## Steps to Post a Conversation

1. Create an object of the `PostConversationRequest` class using the `PostConversationRequestBuilder` class and specify the chatroom ID and text.
2. Call `postConversation()` present in the `LMChatClient` class using your request object.
3. Process the response (`LMResponse<PostConversationResponse>`) as per your requirement.

### Example Usage

```dart
PostConversationRequest request = (PostConversationRequestBuilder()
          ..chatroomId(70989)
          ..text("This is a test message from the SDK")
          ..expiryTime(0))
        .build();

LMResponse<PostConversationResponse> response =
    await lmChatClient.postConversation(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
   // your function to process error message
   processError(response);
}
```

## Models

### PostConversationRequest

List of parameters for the `PostConversationRequest` class

| Variable        | Type   | Description                                               | Optional           |
| --------------- | ------ | --------------------------------------------------------- | ------------------ |
| chatroomId      | int    | Chatroom ID                                              |                    |
| text            | String | Text to be posted                                        |                    |
| expiryTime      | int?   | Expiry time of the conversation                          | :heavy_check_mark: |
| replyId         | int?   | ID of the conversation to which the reply is being posted| :heavy_check_mark: |
| temporaryId     | String | Temporary ID of the conversation                         |                    |
| hasFiles        | bool   | Whether the conversation has files                       |                    |
| attachmentCount | int    | Number of attachments in the conversation                |                    |

### PostConversationResponse

List of parameters for the `PostConversationResponse` class

| Variable     | Type                        | Description                      | Optional           |
| ------------ | --------------------------- | -------------------------------- | ------------------ |
| success      | bool                        | API success status               |                    |
| errorMessage | String?                     | Error message in case of failure | :heavy_check_mark: |
| conversation | [Conversation](common_models.md/#conversation)? | Conversation object created  | :heavy_check_mark: |
