---
sidebar_position: 1
title: Get Chatroom
---

# Get Chatroom

A chatroom is a place where users can interact with each other.The LikeMinds Flutter Chat SDK supports different types of chatrooms, including:

- Open chatrooms: Open to all users within the community, allowing for broad participation and discussions.
- Secret chatrooms: Highly secure and hidden, accessible only to invited members, ensuring utmost privacy and confidentiality.

These diverse chatroom types cater to various communication needs, providing flexibility and control over the conversations within your Flutter chat application. A chatroom can be created by a user or by the community manager.

## Steps to fetch a single chatroom

1. Create an object of the `GetChatroomRequest` class.
2. For creating a post call `getChatroom()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<GetChatroomResponse>`) as per your requirement.

```dart
GetChatroomRequest request = GetChatroomRequestBuilder(chatroomId: 70989).build;
LMResponse<GetChatroomResponse> response = await lmChatClient.getChatroom(request);

if (response.success) {
   // your function to process the response data
   processResponse(response);
} else {
  // your function to process error message
   processError(response);
}
```

## Models

### GetChatroomRequest

List of parameters for the `GetChatroomRequest` class

| Variable   | Type | Description                  | Optional           |
| ---------- | ---- | ---------------------------- | ------------------ |
| chatroomId | int  | Chatroom Id                  |                    |
| page       | int? | Page number for API response | :heavy_check_mark: |
| pageSize   | int? | Page size for API response   | :heavy_check_mark: |

### GetChatroomResponse

List of parameters for the `GetChatroomResponse` class

| Variable                | Type                   | Description                         | Optional           |
| ----------------------- | ---------------------- | ----------------------------------- | ------------------ |
| success                 | bool                   | API success status                  |                    |
| chatroom                | ChatRoom?              | Chatroom data object                | :heavy_check_mark: |
| errorMessage            | String?                | Error log incase the API fails      | :heavy_check_mark: |
| participantCount        | int?                   | Total no of users in a chatroom     | :heavy_check_mark: |
| conversationUsers       | List<User\>?           | List of users in a chatroom         | :heavy_check_mark: |
| chatroomActions         | List<ChatroomAction\>? | List of actions in a chatroom       | :heavy_check_mark: |
| community               | Community?             | Community object                    | :heavy_check_mark: |
| lastConversationId      | int?                   | Last conversation id                | :heavy_check_mark: |
| unreadMessages          | int?                   | Total unread messages in a chatroom | :heavy_check_mark: |
| canAccessSecretChatroom | bool?                  | Can access secret chatroom          | :heavy_check_mark: |

### ChatRoomMember

List of parameters for the `ChatRoomMember` class

| Variable         | Type    | Description              | Optional           |
| ---------------- | ------- | ------------------------ | ------------------ |
| customIntroText  | String? | Custom intro text        | :heavy_check_mark: |
| customTitle      | String? | Custom title             | :heavy_check_mark: |
| id               | int     | User id                  |                    |
| imageUrl         | String? | User image url           | :heavy_check_mark: |
| isGuest          | bool?   | Is guest user            | :heavy_check_mark: |
| isOwner          | bool?   | Is owner of the chatroom | :heavy_check_mark: |
| memberSince      | String? | Member since             | :heavy_check_mark: |
| memberSinceEpoch | int?    | Member since epoch       | :heavy_check_mark: |
| name             | String  | User name                |                    |
| organisationName | String? | Organisation name        | :heavy_check_mark: |
| route            | String? | Route                    | :heavy_check_mark: |
| state            | int     | State                    |                    |
| updatedAt        | int?    | Updated at               | :heavy_check_mark: |
| userUniqueId     | String? | User unique id           | :heavy_check_mark: |
