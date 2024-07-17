import 'package:likeminds_chat_fl/src/models/models.dart';

/// Abstract class for callback methods
/// To be implemented by the user of the SDK
/// And sent to the SDK while initializing
abstract class LMChatSDKCallback {
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

  /// Callback for onAccessTokenExpiredAndRefreshed
  /// This is called when the access token is expired and refreshed
  /// using refresh strategy
  /// [accessToken] is the new access token
  /// [refreshToken] is the new refresh token
  void onAccessTokenExpiredAndRefreshed(
      String accessToken, String refreshToken);
  
  /// Callback for onRefreshTokenExpired.
  /// This is called when the refresh token is expired
  Future<LMAuthToken> onRefreshTokenExpired();
}
