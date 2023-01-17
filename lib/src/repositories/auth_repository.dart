import 'package:likeminds_groupchat/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_groupchat/src/services/auth_service.dart';

class AuthRepository {
  final AuthService authService = AuthService();

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await authService.initiateUser(initiateUserRequest);
  }
}
