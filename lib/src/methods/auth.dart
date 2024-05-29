import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';

/// AuthApi class is responsible for handling all the auth related API calls
class AuthApi {
  final AuthRepository authRepository;

  AuthApi({
    required this.authRepository,
  });

  Future<LMResponse<InitiateUserResponse>> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    return authRepository.initiateUser(initiateUserRequest);
  }

  Future<LMResponse<void>> logout(LogoutRequest logoutRequest) async {
    return authRepository.logout(logoutRequest);
  }
}
