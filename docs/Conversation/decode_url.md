---
sidebar_position: 7
title: Decode URL
---

# Decode URL

You can get the link preview by calling the `decodeUrl()` method present in `LMChatClient` class and passing the request object.

## Steps to Decode a URL

1. Create an object of the `DecodeUrlRequest` class.
2. Call the `decodeUrl()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<DecodeUrlResponse>`) as per your requirement.

### Example Usage

```dart
DecodeUrlRequest request = (DecodeUrlRequestBuilder()
                    ..url("https://www.example.com")).build();

LMResponse<DecodeUrlResponse> response = await lmChatClient.decodeUrl(request);

if (response.success) {
  // your function to handle successful decoding
  handleDecodeSuccess(response.data?.ogTags);
} else {
  // your function to handle decode error
  handleDecodeError(response.errorMessage);
}
```

## Models

### DecodeUrlRequest

List of parameters for the `DecodeUrlRequest` class

| Variable | Type   | Description                      | Optional           |
| -------- | ------ | -------------------------------- | ------------------ |
| url      | String | The URL to decode               |                    |

### DecodeUrlResponse

List of parameters for the `DecodeUrlResponse` class

| Variable | Type         | Description                      | Optional           |
| -------- | ------------ | -------------------------------- | ------------------ |
| ogTags   | [OgTags](common_models.md/#ogtags)? | The Open Graph tags extracted from the URL | :heavy_check_mark: |

