---
sidebar_position: 4
title: Explore Feed
---

# Explore Feed

The Explore Feed is used to explore new chatrooms. You can follow the given steps to integrate this to your chat community. The `getExploreFeed` and `getExploreTabCount` functions are used to fetch the explore feed and the count of channels available in the explore tab, respectively

## Steps to fetch Explore Feed

### 1. Get Explore Feed

1. Create an object of the `GetExploreFeedRequest` class.
2. Call the `getExploreFeed()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<GetExploreFeedResponse>`) as per your requirement.

```dart
GetExploreFeedRequest request = (GetExploreFeedRequestBuilder()
                    ..page(1)
                    ..orderType(1)
                    ..pinned(false)).build();

LMResponse<GetExploreFeedResponse> response = await lmChatClient.getExploreFeed(request);

if (response.success) {
  // your function to process the response data
  processResponse(response);
} else {
  // your function to process error message
  processError(response);
}
```

### 2. Get Explore Tab Count

1. Call the `getExploreTabCount()` function using the instance of the `LMChatClient` class.
2. Process the response (`LMResponse<GetExploreTabCountResponse>`) as per your requirement.

```dart
LMResponse<GetExploreTabCountResponse> response = await lmChatClient.getExploreTabCount();

if (response.success) {
  // your function to process the response data
  processResponse(response);
} else {
  // your function to process error message
  processError(response);
}
```

## Models

### GetExploreFeedRequest

List of parameters for the `GetExploreFeedRequest` class

| Variable   | Type   | Description                      | Optional           |
| ---------- | ------ | -------------------------------- | ------------------ |
| page       | int    | Page number for paginated response |                    |
| orderType  | int    | Type of ordering for chatrooms   |                    |
| pinned     | bool   | Flag to filter pinned chatrooms   |                    |

### GetExploreFeedResponse

List of parameters for the `GetExploreFeedResponse` class

| Variable                | Type                   | Description                         | Optional           |
| ----------------------- | ---------------------- | ----------------------------------- | ------------------ |
| chatrooms               | List<[ChatRoom](common_models.md/#chatroom)\>? | List of chatrooms              | :heavy_check_mark: |
| pinnedChatroomCount     | int?                   | Count of pinned chatrooms           | :heavy_check_mark: |

### GetExploreTabCountResponse

List of parameters for the `GetExploreTabCountResponse` class

| Variable            | Type   | Description                      | Optional           |
| ------------------- | ------ | -------------------------------- | ------------------ |
| totalChannelCount   | int?   | Total number of channels         | :heavy_check_mark: |
| unseenChannelCount   | int?   | Number of unseen channels        | :heavy_check_mark: |
