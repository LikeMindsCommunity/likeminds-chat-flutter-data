import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({
    required this.authService,
  });

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    InitiateUserResponseEntity initiateUserResponseEntity =
        await authService.initiateUser(initiateUserRequest);
    return InitiateUserResponse.fromEntity(initiateUserResponseEntity);
  }

  Future<LogoutResponse> logout(LogoutRequest logoutRequest) async {
    LogoutResponseEntity responseEntity =
        await authService.logout(logoutRequest);
    return LogoutResponse.fromEntity(responseEntity);
  }

  Future<bool> getMemberState() {
    return authService.getMemberState();
  }
}
