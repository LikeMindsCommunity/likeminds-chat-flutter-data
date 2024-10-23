---
sidebar_position: 6
title: Get Participants
---

# Get Participants

To retrieve the list of participants in a chatroom, LikeMinds Flutter Chat SDK provides this feature. It enables you to retrieve user details, such as usernames or profile information, for better engagement and interaction within the chatroom.

## Steps to Get the List of Participants in a Chatroom

1. Create an object of the `GetParticipantsRequest` class.
2. Call the `getParticipants()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<GetParticipantsResponse>`) as per your requirement.

```dart
GetParticipantsRequest request = (GetParticipantsRequestBuilder()
                    ..chatroomId(70989)
                    ..page(1)
                    ..pageSize(10)
                    ..isSecret(false)
                    ..search('John')).build();

LMResponse<GetParticipantsResponse> response = await lmChatClient.getParticipants(request);

if (response.success) {
  // your function to process the response data
  processResponse(response);
} else {
  // your function to process error message
  processError(response.errorMessage);
}
```

## Models

### GetParticipantsRequest

List of parameters for the `GetParticipantsRequest` class

| Variable     | Type   | Description                      | Optional           |
| ------------ | ------ | -------------------------------- | ------------------ |
| chatroomId   | int    | Unique ID of the chatroom       |                    |
| page         | int    | Page number for paginated response |                    |
| pageSize     | int    | Page size for paginated response |                    |
| isSecret     | bool   | Indicates if the chatroom is secret |                    |
| search       | String?| Search string for filtering participants | :heavy_check_mark: |

### GetParticipantsResponse

List of parameters for the `GetParticipantsResponse` class

| Variable              | Type                   | Description                                              | Optional           |
| --------------------- | ---------------------- | -------------------------------------------------------- | ------------------ |
| canEditParticipant    | bool?                  | Indicates if the user can edit participant details       | :heavy_check_mark: |
| participants          | List<[User](common_models.md/#user)\>? | List of participants in the chatroom                   | :heavy_check_mark: |
