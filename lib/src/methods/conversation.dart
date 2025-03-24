import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/models/conversation/conversation_search_request_model.dart';
import 'package:likeminds_chat_fl/src/models/conversation/conversation_search_response_model.dart';
import 'package:likeminds_chat_fl/src/repositories/conversation_repository.dart';

// ignore: lines_longer_than_80_chars
/// ConversationApi class is responsible for handling all the conversation related API calls
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

  Future<LMResponse<ConversationSearchResponse>> searchConversation(
      ConversationSearchRequest request) async {
    return await conversationRepository.searchConversation(request);
  }
}
