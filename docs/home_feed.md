---
sidebar_position: 3
title: Home Feed
---

# Home Feed

The Home Feed is a vital component of many applications, providing users with a centralized hub to discover and engage with various content, including chatrooms, discussions, and other interactive features. In the context of the Flutter SDK, the Home Feed serves as a customizable and dynamic feed that can be tailored to suit your application's needs.

This guide provide step-by-step instructions, code snippets, and best practices for integrating the Home Feed and fetching community chatrooms in your Flutter app.

Let's dive into the world of Home Feed integration with the Flutter SDK and unlock the potential for vibrant chatroom communities within your application.

## Steps to fetch Home Feed

1. Create an object of the `GetHomeFeedRequest` class.
2. Call the `getHomeFeed()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<GetHomeFeedResponse>`) as per your requirement.

```dart
GetHomeFeedRequest request = (GetHomeFeedRequestBuilder()
                    ..page(1)
                    ..pageSize(10)
                    ..isLocalDb(false)).build();

LMResponse<GetHomeFeedResponse> response = await lmChatClient.getHomeFeed(request);

if (response.success) {
  // your function to process the response data
  processResponse(response);
} else {
  // your function to process error message
  processError(response);
}
```

## Models

### GetHomeFeedRequest

List of parameters for the `GetHomeFeedRequest` class

| Variable      | Type      | Description                      | Optional           |
| ------------- | --------- | -------------------------------- | ------------------ |
| page          | int       | Page number for paginated response |                    |
| pageSize      | int?      | Page size for paginated response | :heavy_check_mark: |
| minTimestamp  | int?      | Minimum timestamp for filtering  | :heavy_check_mark: |
| maxTimestamp  | int?      | Maximum timestamp for filtering  | :heavy_check_mark: |
| chatroomTypes | List<int>?| List of chatroom types to filter | :heavy_check_mark: |
| isLocalDb     | bool      | Flag to indicate local DB usage  | :heavy_check_mark: |

### GetHomeFeedResponse

List of parameters for the `GetHomeFeedResponse` class

| Variable                    | Type                                                          | Description                                              | Optional           |
| --------------------------- | ------------------------------------------------------------- | -------------------------------------------------------- | ------------------ |
| communityMeta               | Map<String, [Community](common_models.md/#community)\>?       | Map of communities with their ID as the key              | :heavy_check_mark: |
| chatroomsData               | List<[ChatRoom](common_models.md/#chatroom)\>?                | List of chatrooms                                        | :heavy_check_mark: |
| conversationMeta            | Map<String, [Conversation](common_models.md/#conversation)\>? | Map of conversations with their ID as the key            | :heavy_check_mark: |
| userMeta                    | Map<int, [User](common_models.md/#user)\>?                    | Map of users with their ID as the key                    | :heavy_check_mark: |
| cardAttachmentsMeta         | Map<dynamic, dynamic>?                                        | Map of card attachments                                   | :heavy_check_mark: |
| conversationAttachmentsMeta  | Map<String, List<[Attachment](common_models.md/#attachment)\>>?                               | Map of conversation attachments with their ID as the key | :heavy_check_mark: |
| conversationPollsMeta       | Map<dynamic, dynamic>?                                        | Map of conversation polls                                 | :heavy_check_mark: |
