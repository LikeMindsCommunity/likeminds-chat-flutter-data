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
2. For fetching Home Feed call `getHomeFeed()` present in `LMChatClient` class using your request object.
3. Process the response `LMResponse<GetHomeFeedResponse>` as per your requirement.

```dart
GetHomeFeedRequest request = (GetHomeFeedRequestBuilder()
                ..page(1)..pageSize(10)).build();

LMResponse<GetHomeFeedResponse> response = await lmChatClient.getHomeFeed(request);

if(response.success){
    // your function to process the response data
   processResponse(response);
}else{
    // your function to process error message
   processError(response);
}
```

## Models

### GetHomeFeedRequest

| Variable | Type | Description                      | Optional |
| -------- | ---- | -------------------------------- | -------- |
| page     | int  | page number                      |          |
| pageSize | int  | page size for paginated response |          |

### GetHomeFeedResponse

| Variable                    | Type                                                          | Description                                              | Optional           |
| --------------------------- | ------------------------------------------------------------- | -------------------------------------------------------- | ------------------ |
| success                     | bool                                                          | api success status                                       |                    |
| errorMessage                | String                                                        | error log incase the api fails                           | :heavy_check_mark: |
| communityMeta               | Map<String, [Community](common_models.md/#community)\>?       | Map of communities with their ID as the key              | :heavy_check_mark: |
| chatroomsData               | List<[ChatRoom](common_models.md/#chatroom)\>?                | List of chatrooms                                        | :heavy_check_mark: |
| conversationMeta            | Map<String, [Conversation](common_models.md/#conversation)\>? | Map of conversations with their ID as the key            | :heavy_check_mark: |
| userMeta                    | Map<int, [User](common_models.md/#user)\>?                    | Map of users with their ID as the key                    | :heavy_check_mark: |
| conversationAttachmentsMeta | Map<dynamic, dynamic>?                                        | Map of conversation attachments with their ID as the key | :heavy_check_mark: |
