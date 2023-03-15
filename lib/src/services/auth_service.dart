import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';

abstract class IAuthService {
  Future<InitiateUserResponseEntity> initiateUser(
      InitiateUserRequest initiateUserRequest);
  Future<LogoutResponseEntity> logout(LogoutRequest logoutRequest);
  Future<RefreshResponseEntity> refresh(RefreshRequest refreshRequest);
}

class AuthService extends IAuthService {
  final ApiManager apiManager;

  AuthService({
    required this.apiManager,
  });

  /// Initiate User API
  /// Calls our backend for initiating a LikeMinds user
  /// Returns a [InitiateUserResponse] object
  /// Throws [DioError] if something goes wrong
  @override
  Future<InitiateUserResponseEntity> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    final String apiKey = apiManager.tokenManager.apiKey!;
    try {
      final response = await apiManager.post(
        apiManager.endPoints.authEndpoint,
        data: initiateUserRequest.toJson(),
        options: Options(
          headers: {
            'x-api-key': apiKey,
          },
        ),
      );
      InitiateUserResponseEntity initiateUserResponse =
          InitiateUserResponseEntity.fromJson(response.data);

      // Checking if API returned success
      if (initiateUserResponse.success) {
        // Checking if API returned app access
        if (initiateUserResponse.appAccess!) {
          // If API returned app access, then set tokens and return response
          apiManager.tokenManager.initTokens(
            initiateUserResponse.accessToken!,
            initiateUserResponse.refreshToken!,
          );
          final InitiateUserEntity initiateUser =
              initiateUserResponse.initiateUser!;
          apiManager.tokenManager.setUserId(initiateUser.user.id);
          apiManager.tokenManager.setCommunityId(initiateUser.community.id);
          return initiateUserResponse;
          // Else, if API returned no app access
        } else {
          // If API returned no app access, then logout and return response
          final response = await logout(null);
          return InitiateUserResponseEntity(
            success: false,
            logoutResponse: response,
          );
        }
        // Else, if API returned error message
      } else {
        return initiateUserResponse;
      }
    } on DioError catch (e) {
      InitiateUserResponseEntity initiateUserResponse =
          InitiateUserResponseEntity.fromJson(e.response?.data);
      return initiateUserResponse;
    }
  }

  /// Refresh user
  /// Refreshes a SDK user, and updates tokens
  /// Returns [RefreshResponseEntity] if success
  /// Takes [RefreshRequest] as input
  /// Throws [DioError] if error
  Future<RefreshResponseEntity> refresh(RefreshRequest request) async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        apiManager.endPoints.authRefreshEndpoint,
        options: Options(
          headers: {
            'Authorization': request.refreshToken,
          },
        ),
      );
      RefreshResponseEntity refreshResponse =
          RefreshResponseEntity.fromJson(response.data);

      return refreshResponse;
    } on DioError catch (e) {
      RefreshResponseEntity refreshResponse =
          RefreshResponseEntity.fromJson(e.response?.data);
      return refreshResponse;
    }
  }

  /// Logout user
  /// Logs out a SDK user, and clears tokens
  /// Returns [LogoutResponseEntity] if success
  /// Takes [LogoutRequest] as input
  /// Throws [DioError] if error
  Future<LogoutResponseEntity> logout(LogoutRequest? request) async {
    try {
      final response = await apiManager.post(
        apiManager.endPoints.authLogoutEndpoint,
        data: {
          "refresh_token":
              request!.refreshToken ?? apiManager.tokenManager.refreshToken
        },
      );

      LogoutResponseEntity logoutResponse =
          LogoutResponseEntity.fromJson(response.data);
      request.callback.logoutCallback();
      apiManager.tokenManager.clearTokens();
      return logoutResponse;
    } on DioError catch (e) {
      LogoutResponseEntity logoutResponse =
          LogoutResponseEntity.fromJson(e.response?.data);
      return logoutResponse;
    }
  }
}
