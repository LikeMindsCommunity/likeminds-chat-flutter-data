---
sidebar_position: 3
title: Tag Member in Conversation
---

# Tag Member in Conversation

You can get the list of all the tags present in the community by calling the `getTaggingList()` method present in `LMChatClient` class and passing the request object.

## Steps to tag member in a conversation

1. Create a `TagRequestModel` object, using the `TagRequestModelBuilder` class.
2. For tagging a member in a conversation call `getTaggingList()` function using the instance of `LMChatClient` class, using your request object.
3. Process the response (`LMResponse<TagResponseModel>`) as per your requirement.

```dart
TagRequestModel request = (TagRequestModelBuilder()
      ..chatroomId(CHATROOM_ID))
.build();

LMResponse<TagResponseModel> response =
    await lmClient.getTaggingList(request);

if (response.success) {
    debugPrint("Tagging list fetched");
} else {
    debugPrint("Failed to fetch tagging list");
}
```

### Models

### TagRequestModel

List of parameters for the `TagRequestModel` class

| Variable    | Type    | Description   | Nullable           |
| ----------- | ------- | ------------- | ------------------ |
| chatroomId  | int?    | Chatroom Id   | :heavy_check_mark: |
| page        | int?    | Page number   | :heavy_check_mark: |
| pageSize    | int?    | Page size     | :heavy_check_mark: |
| searchQuery | String? | Search string | :heavy_check_mark: |

### TagResponseModel

List of parameters for the `TagResponseModel` class

| Variable     | Type              | Description                      | Nullable           |
| ------------ | ----------------- | -------------------------------- | ------------------ |
| success      | bool              | API success status               |                    |
| errorMessage | String?           | Error message in case of failure | :heavy_check_mark: |
| members      | List<UserTag\>?  | List of member tags              | :heavy_check_mark: |
| groupTags    | List<dynamic\>? | List of group tags               | :heavy_check_mark: |

## UserTag

List of parameters used in `UserTag`

| Variable                | Type   | Description                      | Optional |
| ----------------------- | ------ | -------------------------------- | -------- |
| name                    | String | name of the user                 | :heavy_check_mark: |
| imageUrl                | String | url of the image                 | :heavy_check_mark: |
| customTitle             | String | custom title of the user         | :heavy_check_mark: |
| id                      | int    | unique id of the user            | :heavy_check_mark: |
| isGuest                 | bool   | is user guest                    | :heavy_check_mark: |
| userUniqueId            | String | unique id of the user            | :heavy_check_mark: |