LikeMinds Chat is a plug and play package for creating a chat functionality in your Flutter app. It is built on top of the LikeMinds API and provides a simple interface for creating chat functionality in your app, in less than 15 minutes.

## Getting started

The starting point is the LikeMinds website. Create your account and get an API key, which you will use to initialize the SDK. You can get the API key from the dashboard of your LikeMinds account.

Then add the package as dependency in pubspec.yaml

```yaml
likeminds_chat_fl: ^1.16.0
```

or you can run this command in the terminal

```bash
flutter pub add likeminds_chat_fl
```

## Usage

To start using the package, import it in your `main.dart` file

```dart
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
```

After adding the import, get an instance of the `LMChatClient` class and initialize it with your API key, and an instance of the LMSdkCallback class.

```dart
 // Initiate the LMChatClient instance
  LMChatClient lmClient;
```

### LMSdkCallback

The `LMSdkCallback` class is a callback class that is used to listen to analytic events from the LikeMinds Chat package. It has 3 methods that you can override to listen to events from the package.

```dart
class YourCallback extends LMSdkCallback {
  @override
  void eventFiredCallback(String eventKey, Map<String, dynamic> propertiesMap) {
    // Implement eventFiredCallback
  }

  @override
  void loginRequiredCallback() {
    // Implement loginRequiredCallback
  }

  @override
  void logoutCallback() {
    // Implement logoutCallback
  }
}
```

### Further usage

After initializing the `LMChatClient` instance, you can use it to access the different mehods exposed by the package. You can read the documentation for the package [here](https://docs.likeminds.community).

## Example

You can find a complete example of how to use the package [here](https://github.com/NateshR/LikeMinds-Flutter-GroupChat-MM) within our sample UI package. You can also clone the repo and run the example app on your device.
