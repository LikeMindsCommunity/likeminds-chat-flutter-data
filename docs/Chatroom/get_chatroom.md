---
sidebar_position: 1
title: Get Chatroom
---

# Get Chatroom

A chatroom is a place where users can interact with each other.The LikeMinds Flutter Chat SDK supports different types of chatrooms, including:

- Open chatrooms: Open to all users within the community, allowing for broad participation and discussions.
- Secret chatrooms: Highly secure and hidden, accessible only to invited members, ensuring utmost privacy and confidentiality.

These diverse chatroom types cater to various communication needs, providing flexibility and control over the conversations within your Flutter chat application. A chatroom can be created by a user or by the community manager.

## Steps to fetch Chatrooms

1. Create an object of the `GetChatroomRequest` class.
2. Call the `getChatroom()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<GetChatroomResponse>`) as per your requirement.

```dart
GetChatroomRequest request = (GetChatroomRequestBuilder()
                    ..chatroomId(70989)
                    ..page(1)
                    ..pageSize(10)).build();

LMResponse<GetChatroomResponse> response = await lmChatClient.getChatroom(request);

if (response.success) {
  // your function to process the response data
  processResponse(response);
} else {
  // your function to process error message
  processError(response.errorMessage);
}
```

## Models

### GetChatroomRequest

List of parameters for the `GetChatroomRequest` class

| Variable   | Type   | Description                      | Optional           |
| ---------- | ------ | -------------------------------- | ------------------ |
| chatroomId | int    | Unique ID of the chatroom       |                    |
| page       | int?   | Page number for paginated response | :heavy_check_mark: |
| pageSize   | int?   | Page size for paginated response | :heavy_check_mark: |

### GetChatroomResponse

List of parameters for the `GetChatroomResponse` class

| Variable                    | Type                                                          | Description                                              | Optional           |
| --------------------------- | ------------------------------------------------------------- | -------------------------------------------------------- | ------------------ |
| canAccessSecretChatroom     | bool?                                                         | Indicates if the user can access a secret chatroom      | :heavy_check_mark: |
| chatroom                    | [ChatRoom](common_models.md/#chatroom)?                      | The chatroom object containing chatroom details          | :heavy_check_mark: |
| chatroomActions             | List<[ChatroomAction](common_models.md/#chatroomaction)\>?   | List of actions available in the chatroom               | :heavy_check_mark: |
| community                   | [Community](common_models.md/#community)?                    | The community object associated with the chatroom        | :heavy_check_mark: |
| conversationUsers           | List<[User](common_models.md/#user)\>?                       | List of users participating in the chatroom             | :heavy_check_mark: |
| lastConversationId          | int?                                                         | ID of the last conversation in the chatroom              | :heavy_check_mark: |
| participantCount            | int?                                                         | Total number of participants in the chatroom             | :heavy_check_mark: |
| unreadMessages              | int?                                                         | Total number of unread messages in the chatroom          | :heavy_check_mark: |

