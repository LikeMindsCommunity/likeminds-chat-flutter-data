---
sidebar_position: 9
title: Logout
---

# Logout

To disconnect a user (say that you’re for instance logging out and logging in as someone new) you can call the `logout()` method present in `LMChatClient` class.

Logging out also fires the `logoutCallback()` method present in `LMSDKCallback` class.

```dart
  /// This method is called when the user wants to initiate log out of the app.
  LogoutRequest request = (LogoutRequestBuilder()
                ..refreshToken(<YOUR_REFRESH_TOKEN>)
                ..deviceId(<DEVICE_ID>)).build();

  LMResponse<LogoutResponse> response = await lmChatClient.logout(request);
  if (response.success) {
     // your function to process the response data
    processResponse(response);
  }

  /// This method is called when the logout is completed, and we want to notify the app by firing an event.
  @override
  void logoutCallback() {
    // Fired when the user is logged out of the app
  }
```
