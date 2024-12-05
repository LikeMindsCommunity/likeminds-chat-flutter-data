import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/chatbot_repository.dart';

class ChatbotApi {
  final ChatbotRepository chatbotRepository;

  ChatbotApi({required this.chatbotRepository});

  Future<LMResponse<GetAIChatbotsResponse>> getAIChatbots(
      GetAIChatbotsRequest request) async {
    return await chatbotRepository.getAIChatbots(request);
  }
}
