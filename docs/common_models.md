---
sidebar_position: 10
title: Common Models
---

# Common Models

Following are the common models used throughout the SDK. These models are referenced wherever required.

### LMResponse

This is a wrapper class for all the responses returned by the SDK. It contains the following parameters:

| Variable     | Type    | Description                            | Optional           |
| ------------ | ------- | -------------------------------------- | ------------------ |
| success      | bool    | API success status                     |                    |
| errorMessage | String? | Error message in case of failure       | :heavy_check_mark: |
| data         | dynamic | Object of specific response data class |                    |

### User

List of parameters used in `User`

| Variable         | Type                            | Description                   | Optional           |
| ---------------- | ------------------------------- | ----------------------------- | ------------------ |
| id               | int                             | unique id of the user         |                    |
| name             | String                          | name of the user              |                    |
| imageUrl         | String                          | profile image url of the user | :heavy_check_mark: |
| isGuest          | bool                            | is user a guest               | :heavy_check_mark: |
| userUniqueId     | String                          | unique id of the user         |                    |
| organisationName | String                          | name of the organisation      | :heavy_check_mark: |
| sdkClientInfo    | [SDKClientInfo](#sdkclientinfo) | sdk client info               | :heavy_check_mark: |
| updatedAt        | int                             | timestamp of last update      | :heavy_check_mark: |
| isOwner          | bool                            | is user an owner              | :heavy_check_mark: |
| customTitle      | String                          | custom title of the user      | :heavy_check_mark: |
| memberSince      | String                          | date of joining the community | :heavy_check_mark: |
| route            | String                          | route of the user             | :heavy_check_mark: |
| state            | int                             | state of the user             | :heavy_check_mark: |
| communityId      | int                             | unique id of the community    | :heavy_check_mark: |
| createdAt        | int                             | timestamp of user creation    | :heavy_check_mark: |

### SDKClientInfo

List of parameters used in `SDKClientInfo`

| Variable     | Type   | Description                | Optional |
| ------------ | ------ | -------------------------- | -------- |
| community    | int    | unique id of the community |          |
| user         | int    | unique id of the user      |          |
| userUniqueId | String | unique id of the user      |          |

### Community

List of parameters used in `Community`

| Variable | Type   | Description                        | Optional           |
| -------- | ------ | ---------------------------------- | ------------------ |
| id       | int    | unique id of the community         |                    |
| name     | String | name of the community              |                    |
| imageUrl | String | profile image url of the community | :heavy_check_mark: |

### ChatRoom

List of parameters used in `ChatRoom`

| Variable            | Type           | Description                       | Optional           |
| ------------------- | -------------- | --------------------------------- | ------------------ |
| id                  | int            | unique id of the chatroom         |                    |
| title               | String         | title of the chatroom             |                    |
| header              | String         | header of the chatroom            |                    |
| communityId         | int            | unique id of the community        |                    |
| communityName       | String         | name of the community             |                    |
| chatroomImageUrl    | String         | profile image url of the chatroom | :heavy_check_mark: |
| autoFollowDone      | bool           | is auto follow done               | :heavy_check_mark: |
| cardCreationTime    | String         | card creation time                | :heavy_check_mark: |
| createdAt           | int            | timestamp of creation             | :heavy_check_mark: |
| lastConversationId  | int            | unique id of last conversation    | :heavy_check_mark: |
| date                | String         | date of the chatroom              | :heavy_check_mark: |
| dateEpoch           | int            | epoch of the date                 | :heavy_check_mark: |
| dateTime            | int            | timestamp of the date             | :heavy_check_mark: |
| followStatus        | bool           | is user following the chatroom    | :heavy_check_mark: |
| includeMembersLater | bool           | is members included later         | :heavy_check_mark: |
| isPrivate           | bool           | is chatroom private               | :heavy_check_mark: |
| isPrivateMember     | bool           | is user a private member          | :heavy_check_mark: |
| isSecret            | bool           | is chatroom secret                | :heavy_check_mark: |
| isTagged            | bool           | is chatroom tagged                | :heavy_check_mark: |
| member              | ChatRoomMember | member of the chatroom            | :heavy_check_mark: |
| muteStatus          | bool           | is chatroom muted                 | :heavy_check_mark: |
| reactions           | List<dynamic\> | list of reactions                 | :heavy_check_mark: |
| secretChatroomLeft  | bool           | is secret chatroom left           | :heavy_check_mark: |
| state               | int            | state of the chatroom             | :heavy_check_mark: |
| type                | int            | type of the chatroom              | :heavy_check_mark: |
| participantCount    | int            | count of participants             | :heavy_check_mark: |

### ChatoomAction

List of parameters used in `ChatoomAction`

| Variable | Type   | Description                      | Optional |
| -------- | ------ | -------------------------------- | -------- |
| id       | int    | unique id of the chatroom action |          |
| title    | String | title of the chatroom action     |          |

### Conversation

List of parameters used in `Conversation`

| Variable            | Type              | Description                             | Optional           |
| ------------------- | ----------------- | --------------------------------------- | ------------------ |
| allowAddOption      | bool              | is add option allowed                   | :heavy_check_mark: |
| answer              | String            | answer of the conversation              | :heavy_check_mark: |
| attachmentCount     | int               | count of attachments                    | :heavy_check_mark: |
| attachments         | List<dynamic\>    | list of attachments                     | :heavy_check_mark: |
| attachmentsUploaded | bool              | is attachments uploaded                 | :heavy_check_mark: |
| chatroomId          | int               | unique id of the chatroom               | :heavy_check_mark: |
| communityId         | int               | unique id of the community              | :heavy_check_mark: |
| createdAt           | String            | timestamp of creation                   | :heavy_check_mark: |
| createdEpoch        | int               | epoch of creation                       | :heavy_check_mark: |
| date                | String            | date of the conversation                | :heavy_check_mark: |
| deletedByUserId     | int               | unique id of deleted user               | :heavy_check_mark: |
| deviceId            | String            | unique id of the device                 | :heavy_check_mark: |
| endTime             | int               | end time of the conversation            | :heavy_check_mark: |
| expiryTime          | int               | expiry time of the conversation         | :heavy_check_mark: |
| hasFiles            | bool              | is conversation has files               | :heavy_check_mark: |
| hasReactions        | bool              | is conversation has reactions           | :heavy_check_mark: |
| id                  | int               | unique id of the conversation           | :heavy_check_mark: |
| internalLink        | String            | internal link of the conversation       | :heavy_check_mark: |
| isAnonymous         | bool              | is conversation anonymous               | :heavy_check_mark: |
| isEdited            | bool              | is conversation edited                  | :heavy_check_mark: |
| lastUpdated         | int               | timestamp of last update                | :heavy_check_mark: |
| multipleSelectNo    | int               | multiple select number                  | :heavy_check_mark: |
| multipleSelectState | int               | multiple select state                   | :heavy_check_mark: |
| ogTags              | [OgTags](#ogtags) | tags of the conversation                | :heavy_check_mark: |
| pollAnswerText      | String            | answer of the poll                      | :heavy_check_mark: |
| pollType            | int               | type of the poll                        | :heavy_check_mark: |
| replyChatroomId     | int               | unique id of the reply chatroom         | :heavy_check_mark: |
| replyId             | int               | unique id of the reply                  | :heavy_check_mark: |
| state               | int               | state of the conversation               | :heavy_check_mark: |
| temporaryId         | String            | unique id of the temporary conversation | :heavy_check_mark: |
| userId              | int               | unique id of the user                   | :heavy_check_mark: |
| memberId            | int               | unique id of the member                 | :heavy_check_mark: |
| toShowResults       | bool              | is show results                         | :heavy_check_mark: |
| pollTypeText        | String            | type of the poll text                   | :heavy_check_mark: |
| submitTypeText      | String            | type of the submit text                 | :heavy_check_mark: |
| isTimeStamp         | bool              | is time stamp                           | :heavy_check_mark: |

### Attachment

List of parameters used in `Attachment`

| Variable     | Type    | Description                     | Optional           |
| ------------ | ------- | ------------------------------- | ------------------ |
| answerId     | int     | unique id of the answer         | :heavy_check_mark: |
| createdAt    | int     | timestamp of creation           | :heavy_check_mark: |
| dimensions   | dynamic | dimensions of the attachment    | :heavy_check_mark: |
| fileUrl      | String  | url of the file                 | :heavy_check_mark: |
| url          | String  | url of the attachment           | :heavy_check_mark: |
| height       | dynamic | height of the attachment        | :heavy_check_mark: |
| id           | int     | unique id of the attachment     | :heavy_check_mark: |
| index        | int     | index of the attachment         | :heavy_check_mark: |
| meta         | dynamic | meta of the attachment          | :heavy_check_mark: |
| name         | String  | name of the attachment          | :heavy_check_mark: |
| thumbnailUrl | String  | thumbnail url of the attachment | :heavy_check_mark: |
| type         | String  | type of the attachment          | :heavy_check_mark: |
| width        | dynamic | width of the attachment         | :heavy_check_mark: |

### UserTag

List of parameters used in `UserTag`

| Variable     | Type   | Description              | Optional           |
| ------------ | ------ | ------------------------ | ------------------ |
| name         | String | name of the user         | :heavy_check_mark: |
| imageUrl     | String | url of the image         | :heavy_check_mark: |
| customTitle  | String | custom title of the user | :heavy_check_mark: |
| id           | int    | unique id of the user    | :heavy_check_mark: |
| isGuest      | bool   | is user guest            | :heavy_check_mark: |
| userUniqueId | String | unique id of the user    | :heavy_check_mark: |

### OgTags

List of parameters used in `OgTags`

| Variable    | Type   | Description                | Optional           |
| ----------- | ------ | -------------------------- | ------------------ |
| description | String | description of the og tags | :heavy_check_mark: |
| image       | String | image of the og tags       | :heavy_check_mark: |
| title       | String | title of the og tags       | :heavy_check_mark: |
| url         | String | url of the og tags         | :heavy_check_mark: |
