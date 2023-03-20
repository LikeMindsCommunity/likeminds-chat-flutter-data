import 'package:likeminds_chat_fl/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_chat_fl/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';

class AuthApi {
  final AuthRepository authRepository;

  AuthApi({
    required this.authRepository,
  });

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return await authRepository.initiateUser(initiateUserRequest);
  }
}
