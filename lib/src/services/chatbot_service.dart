import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

abstract class IChatbotService {
  Future<LMResponse<GetAIChatbotsResponseEntity>> getAIChatbots(
      GetAIChatbotsRequest request);
}

class ChatbotService extends IChatbotService {
  final ApiManager _apiManager;

  ChatbotService({required ApiManager apiManager}) : _apiManager = apiManager;

  @override
  Future<LMResponse<GetAIChatbotsResponseEntity>> getAIChatbots(
      GetAIChatbotsRequest request) async {
    try {
      final response = await _apiManager.client().get(
            '${_apiManager.endPoints.communityEndpoint}/chatbot',
            queryParameters: request.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      return LMResponse.success(
        data: GetAIChatbotsResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e, stacktrace) {
      LMChatPersistence.instance.handleException(e, stacktrace);

      return LMResponse.error(
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }
}
