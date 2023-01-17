import 'package:likeminds_groupchat/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_groupchat/src/repositories/auth_repository.dart';

class AuthApi {
  AuthApi();

  final AuthRepository authRepository = AuthRepository();

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await AuthRepository().initiateUser(initiateUserRequest);
  }
}
