import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/utils/register_device_request_model.dart';
import 'package:likeminds_chat_fl/src/models/utils/register_device_response_model.dart';

class UtilService {
  final ApiManager apiManager;

  UtilService({required this.apiManager});

  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    try {
      final response = await apiManager.post(
        apiManager.endPoints.registerDeviceEndpoint,
        options: Options(
          headers: {
            'x-member-id': '${request.memberId}',
          },
        ),
        queryParameters: {
          'member_id': request.memberId.toString(),
          'device_id': request.deviceId,
          'token': request.token,
        },
      );
      final entity = RegisterDeviceResponseEntity.fromJson(response.data);
      return RegisterDeviceResponse.fromEntity(entity);
    } on DioError catch (e) {
      return RegisterDeviceResponse(
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
        success: false,
      );
    }
  }

  // Future<BrandingResponseEntity> getBranding(BrandingRequest request) async {
  //   try {
  //     final response = await apiManager.get(
  //       apiManager.endPoints.getBrandingEndPoint(request.communityId),
  //       options: Options(
  //         headers: {
  //           'x-member-id': request.userId ?? apiManager.tokenManager.userId,
  //         },
  //       ),
  //     );
  //     BrandingResponseEntity brandingResponse =
  //         BrandingResponseEntity.fromJson(response.data);
  //     return brandingResponse;
  //   } on DioError catch (e) {
  //     BrandingResponseEntity brandingResponse =
  //         BrandingResponseEntity.fromJson(e.response?.data);
  //     return brandingResponse;
  //   }
  // }
}
