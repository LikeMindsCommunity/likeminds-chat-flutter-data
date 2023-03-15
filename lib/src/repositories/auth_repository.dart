import 'package:likeminds_chat_fl/src/models/auth/initiate_user_model.dart';
import 'package:likeminds_chat_fl/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_chat_fl/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_chat_fl/src/models/auth/logout_request_model.dart';
import 'package:likeminds_chat_fl/src/services/auth_service.dart';
// import 'package:likeminds_chat_fl/src/services/local_db_service.dart';
// import 'package:likeminds_chat_fl/src/services/local_preference_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({
    required this.authService,
  });

  // final LocalDBService localDB = LocalDBService();
  // final LocalPreferenceService localPrefs = LocalPreferenceService();

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    InitiateUserResponseEntity initiateUserResponseEntity =
        await authService.initiateUser(initiateUserRequest);
    return InitiateUserResponse.fromEntity(initiateUserResponseEntity);
  }
}
