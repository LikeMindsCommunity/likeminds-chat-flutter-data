---
sidebar_position: 9
title: Logout
---

# Logout

To disconnect a user (say that you’re for instance logging out and logging in as someone new) you can call the `logout()` method present in `LMChatClient` class.

Logging out also fires the `logoutCallback()` method present in `LMSDKCallback` class.

## Steps to Logout

1. Create an object of the `LogoutRequest` class.
2. Call the `logout()` function using the instance of the `LMChatClient` class.
3. Process the response (`LMResponse<void>`) as per your requirement.

```dart
LogoutRequest request = (LogoutRequestBuilder()
                    ..refreshToken('<YOUR_REFRESH_TOKEN>')
                    ..deviceId('<DEVICE_ID>')).build();

LMResponse<void> response = await lmChatClient.logout(request);

if (response.success) {
  // your function to handle successful logout
  handleLogoutSuccess();
} else {
  // your function to handle logout error
  handleLogoutError(response.errorMessage);
}

/// This method is called when the logout is completed, and we want to notify the app by firing an event.
@override
void logoutCallback() {
  // Fired when the user is logged out of the app
}
```

## Models

### LogoutRequest

List of parameters for the `LogoutRequest` class

| Variable    | Type                  | Description                          | Optional           |
| ----------- | --------------------- | ------------------------------------ | ------------------ |
| refreshToken| String?              | The refresh token for the user session | :heavy_check_mark:     |
| deviceId    | String?              | The device ID from which the user is logging out |   :heavy_check_mark:     |
