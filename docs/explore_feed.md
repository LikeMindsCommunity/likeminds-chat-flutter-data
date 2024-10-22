---
sidebar_position: 4
title: Explore Feed
---

# Explore Feed

The Explore Feed is used to explore new chatrooms. You can follow the given steps to integrate this to your chat community.

## Steps to fetch Explore Feed

1. Create an object of the `GetExploreFeedRequest` class.
2. For fetching Explore Feed call `getExploreFeed()` present in `LMChatClient` class using your request object.
3. Process the response `LMResponse<GetExploreFeedResponse>` as per your requirement.

```dart
GetExploreFeedRequest request = (GetExploreFeedRequestBuilder()
              ..page(1)
              ..orderType(1)
              ..pinned(false))
            .build();

LMResponse<GetExploreFeedResponse> response = await lmChatClient.getExploreFeed(request);

if(response.success){
    // your function to process the response data
    processResponse(response);
}else{
    // your function to process error message
    processError(response);
}
```

## Models

### GetExploreFeedRequest

| Variable  | Type | Description                              | Optional |
| --------- | ---- | ---------------------------------------- | -------- |
| page      | int  | page number                              |          |
| orderType | int  | For ordering the chatroom list           |          |
| pinned    | bool | To filter list based on pinned chatrooms |          |

### GetExploreFeedResponse

| Variable            | Type                                           | Description                    | Optional           |
| ------------------- | ---------------------------------------------- | ------------------------------ | ------------------ |
| success             | bool                                           | api success status             |                    |
| errorMessage        | String                                         | error log incase the api fails | :heavy_check_mark: |
| chatrooms           | List<[ChatRoom](common_models.md/#chatroom)\>? | List of chatrooms              | :heavy_check_mark: |
| pinnedChatroomCount | int?                                           | Count of pinned chatrooms      | :heavy_check_mark: |
