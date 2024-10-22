---
sidebar_position: 6
title: Get Participants
---

# Get Participants

To retrieve the list of participants in a chatroom, LikeMinds Flutter Chat SDK provides this feature. It enables you to retrieve user details, such as usernames or profile information, for better engagement and interaction within the chatroom.

## Steps to Get the List of Participants in a Chatroom

1. Create an object of the `GetParticipantsRequest` class, using the `GetParticipantsRequestBuilder` class.
2. For getting the list of participants in a chatroom call `getParticipants()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<GetParticipantsResponse>`) as per your requirement.

```dart
GetParticipantsRequest request = (GetParticipantsRequestBuilder()..chatroomId(70989))
.build();

LMResponse<GetParticipantsResponse> response =
    await lmChatClient.getParticipants(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
   // your function to process error message
   processError(response);
}
```

## Models

### GetParticipantsRequest

List of parameters for the `GetParticipantsRequest` class

| Variable   | Type    | Description        | Optional           |
| ---------- | ------- | ------------------ | ------------------ |
| chatroomId | int     | Chatroom Id        |                    |
| page       | int     | Page number        |                    |
| pageSize   | int     | Page size          |                    |
| isSecret   | bool    | Is secret chatroom |                    |
| search     | String? | Search string      | :heavy_check_mark: |

### GetParticipantsResponse

List of parameters for the `GetParticipantsResponse` class

| Variable           | Type         | Description                      | Optional           |
| ------------------ | ------------ | -------------------------------- | ------------------ |
| success            | bool         | API success status               |                    |
| errorMessage       | String?      | Error message in case of failure | :heavy_check_mark: |
| participants       | List<User\>? | List of participants             | :heavy_check_mark: |
| canEditParticipant | bool?        | Bool to check edit status        | :heavy_check_mark: |
