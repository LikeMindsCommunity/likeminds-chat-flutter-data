import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

class NotificationService {
  final ApiManager apiClient;

  NotificationService({required this.apiClient});

  Future<LMResponse<void>> registerDevice(RegisterDeviceRequest request) async {
    try {
      final response = await apiClient.client().post(
            apiClient.endPoints.registerDeviceEndpoint,
            data: {
              'token': request.token,
            },
            options: Options(
              headers: {
                'x-device-id': request.deviceId,
              },
            ),
          );
      if (!response.data['success']) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      return LMResponse.success(
        data: null,
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
