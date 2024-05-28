import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';

abstract class IAuthService {
  Future<LMResponse<InitiateUserResponseEntity>> initiateUser(
      InitiateUserRequest initiateUserRequest);
  Future<LMResponse<void>> logout(LogoutRequest logoutRequest);
  Future<LMResponse<RefreshResponseEntity>> refresh(
      RefreshRequest refreshRequest);
}

class AuthService extends IAuthService {
  final ApiManager apiManager;

  AuthService({
    required this.apiManager,
  });

  /// Initiate User API
  /// Calls our backend for initiating a LikeMinds user
  /// Returns a [InitiateUserResponse] object
  /// Throws [DioException] if something goes wrong
  @override
  Future<LMResponse<InitiateUserResponseEntity>> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    try {
      final BaseOptions options = apiManager.client().options;
      final headers = options.headers;
      final Response response = await apiManager.client().post(
            options: Options(
              headers: {
                ...headers,
                'x-api-key': apiManager.tokenManager.apiKey,
              },
            ),
            apiManager.endPoints.authEndpoint,
            data: initiateUserRequest.toJson(),
          );

      // Checking if API returned success
      if (response.data['success'] && response.data['data'] != null) {
        // Checking if API returned app access
        final InitiateUserResponseEntity initiateUserEntity =
            InitiateUserResponseEntity.fromJson(response.data['data']);

        if (initiateUserEntity.appAccess!) {
          // If API returned app access, then set tokens and return response
          apiManager.tokenManager.initTokens(
            initiateUserEntity.accessToken!,
            initiateUserEntity.refreshToken!,
          );
          final InitiateUserEntity initiateUser =
              initiateUserEntity.initiateUser!;
          apiManager.tokenManager.setUserId(initiateUser.user.id);
          apiManager.tokenManager.setCommunityId(initiateUser.community.id);
          return LMResponse.success(
            data: initiateUserEntity,
          );
          // Else, if API returned no app access
        } else {
          // If API returned no app access, then logout and return response
          final response = await logout(null);
          return LMResponse.error(
              errorMessage: response.errorMessage ?? 'An error occurred');
        }
        // Else, if API returned error message
      } else {
        return LMResponse.error(
            errorMessage:
                response.data['error_message'] ?? 'An error occurred');
      }
    } on DioException catch (e) {
      debugPrint("Error from initiate user: $e");
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  /// Refresh user
  /// Refreshes a SDK user, and updates tokens
  /// Returns [RefreshResponseEntity] if success
  /// Takes [RefreshRequest] as input
  /// Throws [DioException] if error
  @override
  Future<LMResponse<RefreshResponseEntity>> refresh(
      RefreshRequest request) async {
    try {
      final BaseOptions options = apiManager.client(isRefresh: true).options;
      final headers = options.headers;
      final response = await apiManager.client(isRefresh: true).post(
            apiManager.endPoints.authRefreshEndpoint,
            options: Options(
              headers: {
                ...headers,
                'Authorization': request.refreshToken,
              },
            ),
          );
      if (response.data['success'] == false || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'],
        );
      }

      RefreshResponseEntity refreshResponse =
          RefreshResponseEntity.fromJson(response.data['data']);

      return LMResponse.success(
        data: refreshResponse,
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  /// Logout user
  /// Logs out a SDK user, and clears tokens
  /// Returns [LogoutResponseEntity] if success
  /// Takes [LogoutRequest] as input
  /// Throws [DioException] if error
  @override
  Future<LMResponse<void>> logout(LogoutRequest? request) async {
    try {
      final response = await apiManager.client().post(
        apiManager.endPoints.authLogoutEndpoint,
        data: {
          "refresh_token":
              request!.refreshToken ?? apiManager.tokenManager.refreshToken
        },
      );

      if (response.data['success'] == false) {
        return LMResponse.error(
          errorMessage: response.data['error_message'],
        );
      }

      request.callback?.logoutCallback();
      apiManager.tokenManager.clearTokens();
      return LMResponse<void>.success(
        data: null,
      );
    } on DioException catch (e) {
      LogoutResponseEntity logoutResponse =
          LogoutResponseEntity.fromJson(e.response?.data);
      return LMResponse.error(
        errorMessage: logoutResponse.errorMessage ?? 'An error occurred',
      );
    }
  }

  /// Get the state of the member for feedroom access
  /// Returns the state of the member
  // Future<LMResponse<MemberStateResponseEntity>> getMemberState() async {
  //   try {
  //     final response = await apiManager.get(
  //       apiManager.endPoints.memberStateEndpoint,
  //     );
  //     debugPrint("Response from access check: ${response.data}");
  //     if (response.data['success'] == true && response.data['data'] != null) {
  //       final memberStateResponseEntity =
  //           MemberStateResponseEntity.fromJson(response.data);

  //       return LMResponse.success(
  //         data: memberStateResponseEntity,
  //       );
  //     } else {
  //       return LMResponse.error(
  //         errorMessage: response.data['error_message'],
  //       );
  //     }
  //   } on DioException catch (e) {
  //     debugPrint("Error from get member state access: $e");
  //     return LMResponse.error(
  //       errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
  //     );
  //   }
  // }
}
