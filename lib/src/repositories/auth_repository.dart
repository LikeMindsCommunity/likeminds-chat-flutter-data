import 'package:likeminds_groupchat/src/models/auth/initiate_user_model.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_request_model.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_response_model.dart';
import 'package:likeminds_groupchat/src/models/auth/logout_request_model.dart';
import 'package:likeminds_groupchat/src/services/auth_service.dart';
import 'package:likeminds_groupchat/src/services/local_db_service.dart';
import 'package:likeminds_groupchat/src/services/local_preference_service.dart';

class AuthRepository {
  final AuthService authService = AuthService();
  final LocalDBService localDB = LocalDBService();
  final LocalPreferenceService localPrefs = LocalPreferenceService();

  Future<InitiateUserResponse> initiateUser(
      InitiateUserRequest initiateUserRequest) async {
    InitiateUserResponse initiateUserResponse =
        await authService.initiateUser(initiateUserRequest);
    if (initiateUserResponse.success) {
      Map<String, dynamic> data = initiateUserResponse.data!;
      if (data["app_access"]) {
        InitiateUserResponse newResponse = InitiateUserResponse(success: true);
        newResponse.initiateUser = InitiateUser.fromJson(data);
        newResponse.appAccess = true;
        localDB.put('user', newResponse.initiateUser!.user);
        localDB.put('community', newResponse.initiateUser!.community);
        localPrefs.setString('user_id', newResponse.initiateUser!.user.id);
        localPrefs.setString('access_token', data['access_token']);
        localPrefs.setString('refresh_token', data['refresh_token']);
        localPrefs.setBool('is_guest', newResponse.initiateUser!.user.isGuest);
        return newResponse;
      } else {
        initiateUserResponse.success = false;
        initiateUserResponse.data = null;
        //Add mechanism for automatically fetching device id
        LogoutRequest logout = LogoutRequest(deviceId: "test-dev-id");
        authService.logout(logout);
        localDB.clear();
        localPrefs.clear();
        return initiateUserResponse;
      }
    } else {
      return initiateUserResponse;
    }
  }
}
