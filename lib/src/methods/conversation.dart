import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/conversation_repository.dart';

class ConversationApi {
  final ConversationRepository conversationRepository;

  ConversationApi({required this.conversationRepository});

  Future<LMResponse<GetConversationResponse>> getConversation(
      GetConversationRequest request) async {
    GetConversationResponse response =
        await conversationRepository.getConversation(request);
    return LMResponse<GetConversationResponse>(
      success: true,
      data: response,
    );
  }

  Future<LMResponse<GetSingleConversationResponse>> getSingleConversation(
      GetSingleConversationRequest request) async {
    GetSingleConversationResponse response =
        await conversationRepository.getSingleConversation(request);
    return LMResponse<GetSingleConversationResponse>(
      success: true,
      data: response,
    );
  }

  Future<LMResponse<PostConversationResponse>> postConversation(
      PostConversationRequest request) async {
    PostConversationResponse response =
        await conversationRepository.postConversation(request);
    return LMResponse<PostConversationResponse>(
      success: true,
      data: response,
    );
  }

  Future<LMResponse<EditConversationResponse>> editConversation(
      EditConversationRequest request) async {
    EditConversationResponse response =
        await conversationRepository.editConversation(request);
    return LMResponse<EditConversationResponse>(
      success: true,
      data: response,
    );
  }

  Future<LMResponse<DeleteConversationResponse>> deleteConversation(
      DeleteConversationRequest request) async {
    DeleteConversationResponse response =
        await conversationRepository.deleteConversation(request);
    return LMResponse<DeleteConversationResponse>(
      success: true,
      data: response,
    );
  }
}
