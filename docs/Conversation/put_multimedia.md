---
sidebar_position: 4
title: Put Multimedia
---

# Put Multimedia

The LikeMinds Flutter Chat SDK provides the Put Multimedia feature, allowing you to attach multimedia files to your conversations effortlessly. By utilizing this feature, you can enrich your conversations with various types of media, such as images, videos, documents, and more.

## Steps to Put Multimedia in a Conversation

1. Create an object of the `PutMultimediaRequest` class, using the `PutMultimediaRequestBuilder` class.

   :::note
   Upload your file to your chosen provider, and use the URL of the uploaded file in the request.
   :::

2. For putting multimedia in a chatroom call `putMultimedia()` present in `LMChatClient` class using your request object.
3. Process the response (`LMResponse<PutMultimediaResponse>`) as per your requirement.

```dart
PutMultimediaRequest request = (PutMultimediaRequestBuilder()
    ..conversationId(237890)
    ..url("path/to/file")
    ..index(1)
    ..type("image")
    ..meta(meta))
.build();

LMResponse<PutMultimediaResponse> response =
    await lmChatClient.putMultimedia(request);

if (response.success) {
     // your function to process the response data
   processResponse(response);
} else {
    // your function to process error message
   processError(response);
}
```

## Models

### PutMultimediaRequest

List of parameters for the `PutMultimediaRequest` class

| Variable       | Type                   | Description                 | Optional           |
| -------------- | ---------------------- | --------------------------- | ------------------ |
| conversationId | int                    | Conversation Id             |                    |
| url            | String                 | URL of the multimedia       |                    |
| height         | int                    | Height of the multimedia    |                    |
| width          | int                    | Width of the multimedia     |                    |
| filesCount     | int                    | Count of attachments        |                    |
| index          | int                    | Index of the multimedia     |                    |
| type           | String                 | Type of the multimedia      |                    |
| meta           | Map<String, dynamic\>? | Meta data of the multimedia | :heavy_check_mark: |

### PutMultimediaResponse

List of parameters for the `PutMultimediaResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
| data         | dynamic | Data object of the response      | :heavy_check_mark: |
