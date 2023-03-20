/// Abstract class for callback methods
/// To be implemented by the user of the SDK
/// And sent to the SDK while initializing
abstract class LMSdkCallback {
  /// Callback for interaction events in the SDK
  /// This is called when any event is fired from the UI
  void eventFiredCallback(String eventKey, Map<String, dynamic> propertiesMap);

  /// Callback for when the user is required to be logged in
  /// This is called when the user is not logged in and tries to access a feature that requires login
  void loginRequiredCallback();

  /// Callback for when the user is logged out
  /// This is called when the user is logged out from the SDK
  void logoutCallback();

  /// Callback for profile route
  /// This is called when the user clicks on the profile button in the UI
  void profileRouteCallback({required String lmUserId}) {}
}
