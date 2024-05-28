import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/conversation_repository.dart';

class ConversationApi {
  final ConversationRepository conversationRepository;

  ConversationApi({required this.conversationRepository});

  Future<LMResponse<GetConversationResponse>> getConversation(
      GetConversationRequest request) async {
    return await conversationRepository.getConversation(request);
  }

  Future<LMResponse<PostConversationResponse>> postConversation(
      PostConversationRequest request) async {
    return await conversationRepository.postConversation(request);
  }

  Future<LMResponse<EditConversationResponse>> editConversation(
      EditConversationRequest request) async {
    return await conversationRepository.editConversation(request);
  }

  Future<LMResponse<DeleteConversationResponse>> deleteConversation(
      DeleteConversationRequest request) async {
    return await conversationRepository.deleteConversation(request);
  }
}
