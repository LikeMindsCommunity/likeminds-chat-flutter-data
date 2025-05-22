import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

class UtilService {
  final ApiManager apiManager;

  UtilService({required this.apiManager});

  Future<LMResponse<void>> registerDevice(RegisterDeviceRequest request) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.registerDeviceEndpoint,
            options: Options(
              headers: {
                'x-member-id': '${request.memberId}',
              },
            ),
            queryParameters: request.toJson(),
          );
      if (!response.data['success']) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(data: null);
    } on DioException catch (e, stacktrace) {
      LMChatPersistence.instance.handleException(e, stacktrace);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
