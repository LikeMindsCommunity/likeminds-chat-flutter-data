import 'package:dio/dio.dart';
import 'package:likeminds_groupchat/src/endpoints.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_groupchat/src/models/auth/logout_request_model.dart';
import 'package:likeminds_groupchat/src/models/auth/logout_response_model.dart';

abstract class IAuthService {
  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest);
  Future<LogoutResponse> logout(LogoutRequest logoutRequest);
}

class AuthService extends IAuthService {
  late final Dio _dio;

  AuthService() {
    _dio = Dio();
  }

  /// Initiate User API
  /// Calls our backend for initiating a LikeMinds user
  /// Returns a [InitiateUserResponse] object
  /// Throws [DioError] if something goes wrong
  @override
  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    final String? apiKey = initiateUserRequest.apiKey;
    try {
      final response = await _dio.post(
        AUTH_INITIATE_ENDPOINT,
        data: initiateUserRequest.toJson(),
        options: Options(
          headers: {
            'x-api-key': apiKey,
          },
        ),
      );
      return InitiateUserResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// Logout API
  /// Calls our backend for logging out a LikeMinds user
  /// Returns a [LogoutResponse] object
  @override
  Future<LogoutResponse> logout(LogoutRequest logoutRequest) async {
    // TODO: Get Access Token saved in local storage
    const String authToken = "xyz-123";

    //TODO: Add refresh token to logout request

    final response = await _dio.post(
      LOGOUT_ENDPOINT,
      data: logoutRequest.toJson(),
      options: Options(
        headers: {
          'Authorization': authToken,
        },
      ),
    );
    return LogoutResponse.fromJson(response.data);
  }
}
