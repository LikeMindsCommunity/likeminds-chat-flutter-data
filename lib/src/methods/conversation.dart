import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/conversation_repository.dart';

class ConversationApi {
  final ConversationRepository conversationRepository;

  ConversationApi({required this.conversationRepository});

  Future<LMResponse<GetConversationResponse>> getConversation(
      GetConversationRequest request) async {
    GetConversationResponse response =
        await conversationRepository.getConversation(request);
    return LMResponse<GetConversationResponse>(success: true, data: response);
  }
}
