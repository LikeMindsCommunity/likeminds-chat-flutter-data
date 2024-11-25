import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/chatbot_service.dart';

class ChatbotRepository {
  final ChatbotService chatbotService;

  ChatbotRepository({required this.chatbotService});

  Future<LMResponse<GetAIChatbotsResponse>> getAIChatbots(
      GetAIChatbotsRequest request) async {
    LMResponse<GetAIChatbotsResponseEntity> responseEntity =
        await chatbotService.getAIChatbots(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: GetAIChatbotsResponse.fromEntity(
        responseEntity.data!,
      ),
    );
  }
}
