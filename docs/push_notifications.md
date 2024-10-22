---
sidebar_position: 7
title: Push Notifications
---

# Push Notifications

Push notifications are a powerful way to engage with your users and keep them informed about important updates and events within your Flutter application. By integrating push notification functionality into your app using the Flutter SDK, you can send targeted and personalized messages directly to your users' devices, even when your app is not actively running.

By following the step-by-step instructions in this guide and leveraging the capabilities of the Flutter SDK, you will be able to seamlessly integrate push notifications into your Flutter application and unlock the full potential of real-time communication with your users.

Let's get started with implementing push notification functionality in your Flutter app!

## Set up the Firebase Server key

Update Firebase Server Key on the LikeMinds dashboard. You can find a detailed tutorial [here](/docs/notification.md).

## Set up notifications in your Flutter project.

This is some boilerplate code example using some common Flutter libraries to get information for the device, setup notifications, accessing token and managing permissions. It is upto you how you want to implement it and send the data. We require the `deviceId`, `member_id` and `fcmToken` to register the device with LikeMinds. You need these two values to receive notifications from LikeMinds.

**1. Setup notications in your flutter project, below code is given for your reference.**

```dart
/// Setup notifications
void setupNotifications() async {
  await Firebase.initializeApp();
  final devId = await deviceId();
  final fcmToken = await setupMessaging();
  if (fcmToken == null) {
    debugPrint("FCM token is null or permission declined");
    return;
  }
  // Register device with LikeMinds, and listen for notifications
  RegisterDeviceRequest request = (RegisterDeviceRequestBuilder()
                      ..token(fcmToken)
                      ..memberId(CURR_MEMBER_ID)
                      ..deviceId(deviceId)).build();

  final response = await lmChatClient.registerDevice(request);

  if(response.success){
    // your function to process the response data
    processResponse(response);
  }else{
    // your function to process error message
    processError(response.errorMessage);
  }
}
```

You can use this code snippet below which uses the `device_info` plugin to get the device id. You can use any other method to get the device id.

```dart
/// Get device id using device_info plugin
Future<String> deviceId() async {
  final deviceInfo = await DeviceInfoPlugin().deviceInfo;
  final deviceId =
      deviceInfo.data["identifierForVendor"] ?? deviceInfo.data["id"];
  debugPrint("Device id - $deviceId");
  return deviceId.toString();
}
```

You can use this code snippet below which uses the `firebase_messaging` plugin to get the FCM token, and initialize messaging instance.

```dart
/// Setup Firebase messaging on your app, to work with LikeMinds notifications
Future<String?> setupMessaging() async {
  final messaging = FirebaseMessaging.instance;
  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // Get the token only when permission is granted
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    final token = await messaging.getToken();
    return token.toString();
  } else {
    return null;
  }
}
```

**2. Call the above function in `void main()` before running your flutter application**

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupNotifications();
  runApp(const MyApp());
}
```
