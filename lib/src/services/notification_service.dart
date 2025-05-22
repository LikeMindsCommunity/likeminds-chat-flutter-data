import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

class NotificationService {
  final ApiManager apiManager;

  NotificationService({required this.apiManager});

  Future<LMResponse<void>> registerDevice(RegisterDeviceRequest request) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.registerDeviceEndpoint,
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
    } on DioException catch (e, stacktrace) {
      LMChatPersistence.instance.handleException(e, stacktrace);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
