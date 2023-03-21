import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/auth_repository.dart';

class AuthApi {
  final AuthRepository authRepository;

  AuthApi({
    required this.authRepository,
  });

  Future<LMResponse<InitiateUserResponse>> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    InitiateUserResponse response =
        await authRepository.initiateUser(initiateUserRequest);
    return LMResponse<InitiateUserResponse>(
      data: response,
      success: response.success,
      errorMessage: response.errorMessage,
    );
  }

  Future<LMResponse<LogoutResponse>> logout(LogoutRequest logoutRequest) async {
    LogoutResponse response = await authRepository.logout(logoutRequest);
    return LMResponse<LogoutResponse>(
      data: response,
      success: response.success,
      errorMessage: response.errorMessage,
    );
  }
}
