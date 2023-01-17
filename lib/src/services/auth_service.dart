import 'package:dio/dio.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_response_model.dart';

class AuthService {
  final Dio _dio = Dio();
  final String authHost = "https://betaauth.likeminds.community/sdk/initiate";

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    final String? apiKey = initiateUserRequest.apiKey;
    final response = await _dio.post(
      authHost,
      data: initiateUserRequest.toJson(),
      options: Options(
        headers: {
          'x-api-key': apiKey,
        },
      ),
    );
    return InitiateUserResponse.fromJson(response.data);
  }
}
