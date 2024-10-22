---
sidebar_position: 1
title: Get Conversations
---

# Get Conversations

Simplify your chat application development with LikeMinds Flutter Chat SDK. Enhance user conversations, enable real-time messaging, and provide seamless communication experiences with minimal coding effort. By utilizing this feature you can view all the conversations in the chatroom.

## Steps to fetch Conversations inside a Chatroom

1. Create an object of the `GetConversationRequest` class using the `GetConversationRequestBuilder` class.
2. For creating a post call `getConversation()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<GetConversationResponse>`) as per your requirement.

```dart
GetConversationRequest request = (GetConversationRequestBuilder()
      ..chatroomId(70989)
      ..page(1)
      ..pageSize(100)
      ..maxTimestamp(DateTime.now().millisecondsSinceEpoch)
      ..minTimestamp(0))
    .build();

LMResponse<GetConversationResponse> response =
    await lmChatClient.getConversation(request);

if (response.success) {
    // your function to process the response data
   processResponse(response);
} else {
   // your function to process error message
   processError(response);
}
```

## Models

### GetConversationRequest

List of parameters for the `GetConversationRequest` class

| Variable     | Type | Description                           | Optional |
| ------------ | ---- | ------------------------------------- | -------- |
| chatroomId   | int  | Chatroom Id                           |          |
| page         | int  | Page number for API response          |          |
| pageSize     | int  | Page size for API response            |          |
| maxTimestamp | int  | Maximum timestamp for API response    |          |
| minTimestamp | int  | Minimum timestamp for API response    |          |
| isLocalDB    | bool | Whether to fetch from local DB or not |          |

### GetConversationResponse

List of parameters for the `GetConversationResponse` class

| Variable                    | Type                        | Description                               | Optional           |
| --------------------------- | --------------------------- | ----------------------------------------- | ------------------ |
| success                     | bool                        | API success status                        |                    |
| conversationData            | List<Conversation\>?        | List of conversations                     | :heavy_check_mark: |
| errorMessage                | String?                     | Error log incase the API fails            | :heavy_check_mark: |
| chatroomMeta                | Map<int, ChatRoom\>?        | Map of chatroom meta data                 | :heavy_check_mark: |
| communityMeta               | Map<int, Community\>?       | Map of community meta data                | :heavy_check_mark: |
| userMeta                    | Map<int, User\>?            | Map of user meta data                     | :heavy_check_mark: |
| conversationMeta            | Map<String, Conversation\>? | Map of conversation meta data             | :heavy_check_mark: |
| conversationAttachmentsMeta | Map<String, dynamic\>?      | Map of conversation attachments meta data | :heavy_check_mark: |
