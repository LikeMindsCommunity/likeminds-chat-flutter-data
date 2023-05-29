import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';

class AccessService {
  final ApiManager apiManager;

  AccessService({required this.apiManager});

  /// Get access for a particular post access type
  /// [accessType] - The access type to check for
  /// Returns true if the user has access, false otherwise
  // Future<bool> getAccess(String accessType) async {
  //   try {
  //     final response = await apiClient.client().get(
  //           apiClient.getEndpoints.accessEndpoint,
  //           queryParameters: {
  //             'access_type': accessType,
  //           },
  //           options: Options(
  //             headers: {
  //               'x-member-id': '${apiClient.getUserId}',
  //               'x-api-key': '${apiClient.getApiKey}',
  //             },
  //           ),
  //         );
  //     print("Response from access check: ${response.data}");
  //     if (response.data['access'] == true && response.data['success'] == true) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } on DioError catch (e) {
  //     print("Error from get post: $e");
  //     return false;
  //   }
  // }

  /// Get the state of the member for feedroom access
  /// Returns the state of the member
  Future<MemberStateResponseEntity> getMemberState() async {
    try {
      final response = await apiManager.client().get(
            apiManager.endPoints.memberStateEndpoint,
            options: Options(
              headers: {
                'x-api-key': '${apiManager.tokenManager.apiKey}',
              },
            ),
          );

      final memberStateResponseEntity =
          MemberStateResponseEntity.fromJson(response.data);

      return memberStateResponseEntity;
    } on DioError catch (e) {
      print("Error from get member state access: $e");
      return MemberStateResponseEntity(
          success: false, errorMessage: e.toString());
    }
  }
}
