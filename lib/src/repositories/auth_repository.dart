import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({
    required this.authService,
  });

  Future<LMResponse<InitiateUserResponse>> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    LMResponse<InitiateUserResponseEntity> initiateUserResponseEntity =
        await authService.initiateUser(initiateUserRequest);
    if (!initiateUserResponseEntity.success) {
      return LMResponse.error(
          errorMessage: initiateUserResponseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: initiateUserResponseEntity,
      data: InitiateUserResponse.fromEntity(initiateUserResponseEntity.data!),
    );
  }

  Future<LMResponse<void>> logout(LogoutRequest logoutRequest) async {
    LMResponse<void> responseEntity = await authService.logout(logoutRequest);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.success(
      data: null,
    );
  }
}
