import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

class NotificationService {
  final ApiManager apiClient;

  NotificationService({required this.apiClient});

  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.endPoints.registerDeviceEndpoint,
            data: {
              'token': request.token,
            },
            options: Options(
              headers: {
                'x-api-key': '${apiClient.tokenManager.apiKey}',
                'x-device-id': request.deviceId,
              },
            ),
          );
      final entity = RegisterDeviceResponseEntity.fromJson(response.data);
      return RegisterDeviceResponse.fromEntity(entity);
    } on DioError catch (e) {
      return RegisterDeviceResponse(
        errorMessage: e.message,
        success: false,
      );
    }
  }
}
