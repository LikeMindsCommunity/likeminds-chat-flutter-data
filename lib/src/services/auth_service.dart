import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/constant/string_constant.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

abstract class IAuthService {
  Future<LMResponse<InitiateUserResponseEntity>> initiateUser(
      InitiateUserRequest initiateUserRequest);

  Future<LMResponse<ValidateUserResponseEntity>> validateUser(
      ValidateUserRequest validateUserRequest);
  Future<LMResponse<void>> logout(LogoutRequest logoutRequest);
  Future<LMResponse<RefreshResponseEntity>> refreshAccessToken(
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
      final Response response = await apiManager.client().post(
            options: Options(
              headers: {
                'x-api-key': initiateUserRequest.apiKey,
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
          await apiManager.tokenManager.updateTokens(
            initiateUserEntity.accessToken!,
            initiateUserEntity.refreshToken!,
          );

          final localPref = LMChatPersistence.instance;
          await localPref.insertOrUpdateValueInCache((LMChatCacheBuilder()
                ..key(kApiKey)
                ..value(initiateUserRequest.apiKey))
              .build());
          // save user in local storage
          await localPref.deleteUser();
          await localPref
              .insertOrUpdateUser(User.fromEntity(initiateUserEntity.user!));
          // save community in local storage
          await localPref.deleteCommunity();
          await localPref.insertOrUpdateCommunity(
              Community.fromEntity(initiateUserEntity.community!));
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

  /// Validate User API
  /// Calls our backend for validating a LikeMinds user
  /// Returns a [ValidateUserResponseEntity] object
  /// Throws [DioException] if something goes wrong
  @override
  Future<LMResponse<ValidateUserResponseEntity>> validateUser(
      ValidateUserRequest validateUserRequest) async {
    try {
      // update tokens
      await apiManager.tokenManager.updateTokens(
        validateUserRequest.accessToken,
        validateUserRequest.refreshToken,
      );
      final Response response = await apiManager.client().get(
            apiManager.endPoints.authEndpoint,
            options: Options(
              headers: {
                'Authorization': validateUserRequest.accessToken,
              },
            ),
          );

      if (response.data['success'] && response.data['data'] != null) {
        final ValidateUserResponseEntity validateUserEntity =
            ValidateUserResponseEntity.fromJson(response.data['data']);
        if (validateUserEntity.appAccess!) {
          final localPref = LMChatPersistence.instance;
          // save user in local storage
          await localPref.deleteUser();
          await localPref
              .insertOrUpdateUser(User.fromEntity(validateUserEntity.user!));
          // save community in local storage
          await localPref.deleteCommunity();
          await localPref.insertOrUpdateCommunity(
              Community.fromEntity(validateUserEntity.community!));
          return LMResponse.success(
            data: validateUserEntity,
          );
        } else {
          return LMResponse.error(
            errorMessage: 'User does not have access to the app',
          );
        }
      } else {
        return LMResponse.error(
          errorMessage: response.data['error_message'],
        );
      }
    } on DioException catch (e) {
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
  Future<LMResponse<RefreshResponseEntity>> refreshAccessToken(
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
      final localPref = LMChatPersistence.instance;
      await localPref.deleteUser();
      await localPref.deleteCommunity();
      await localPref.deleteMemberState();
      await localPref.clearCache();

      return LMResponse<void>.success(
        data: null,
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
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
