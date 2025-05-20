import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

class LoggerService {
  final ApiManager apiManager;

  LoggerService({required this.apiManager});

  Future<LMResponse<void>> pushLogs({required PushLogRequest request}) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.loggerEndpoint,
            data: request.toJson(),
          );
      if (response.data['success'] == true) {
        return LMResponse(success: true);
      } else {
        return LMResponse(
          success: false,
          errorMessage: response.data['error_message'],
        );
      }
    } on DioException catch (e, stacktrace) {
      LMChatPersistence.instance.handleException(e, stacktrace);
      String? errorMessage;
      if (e.response != null && e.response!.data != null) {
        errorMessage = e.response!.data['error_message'];
      }
      return LMResponse(
        success: false,
        errorMessage: errorMessage ?? "An error occurred",
      );
    }
  }
}
