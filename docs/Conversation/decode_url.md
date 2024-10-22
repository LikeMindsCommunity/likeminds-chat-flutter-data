---
sidebar_position: 7
title: Decode URL
---

# Decode URL

You can get the link preview by calling the `decodeUrl()` method present in `LMChatClient` class and passing the request object.

## Steps to decode url

1. Create a `DecodeUrlRequest` object, using the `DecodeUrlRequestBuilder` class.
2. For decoding url call `decodeUrl()` function using the instance of `LMChatClient` class, using your request object.
3. Process the response (`LMResponse<DecodeUrlResponse>`) as per your requirement.

```dart
final LMChatClient lmClient = ...;

DecodeUrlRequest request = (DecodeUrlRequestBuilder()
      ..url("https://www.google.com"))
.build();

LMResponse<DecodeUrlResponse> response =
    await lmClient.decodeUrl(request);

if (response.success) {
    debugPrint("Link preview fetched");
} else {
    debugPrint("Failed to fetch link preview");
}
```

### Models

### DecodeUrlRequest

List of parameters for the `DecodeUrlRequest` class

| Variable | Type   | Description | Optional |
| -------- | ------ | ----------- | -------- |
| url      | String | Url         |          |

### DecodeUrlResponse

List of parameters for the `DecodeUrlResponse` class

| Variable     | Type    | Description                      | Optional           |
| ------------ | ------- | -------------------------------- | ------------------ |
| success      | bool    | API success status               |                    |
| errorMessage | String? | Error message in case of failure | :heavy_check_mark: |
| ogTags       | OgTags? | Link preview data                | :heavy_check_mark: |
