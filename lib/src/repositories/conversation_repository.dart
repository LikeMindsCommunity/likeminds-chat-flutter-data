import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/conversation_service.dart';

class ConversationRepository {
  final ConversationService conversationService;

  ConversationRepository({required this.conversationService});

  Future<GetConversationResponse> getConversation(
      GetConversationRequest request) async {
    GetConversationResponseEntity responseEntity =
        await conversationService.getConversation(request);
    return GetConversationResponse.fromEntity(responseEntity);
  }

  Future<GetSingleConversationResponse> getSingleConversation(
      GetSingleConversationRequest request) async {
    GetSingleConversationResponseEntity responseEntity =
        await conversationService.getSingleConversation(request);
    return GetSingleConversationResponse.fromEntity(responseEntity);
  }

  Future<PostConversationResponse> postConversation(
      PostConversationRequest request) async {
    PostConversationResponseEntity responseEntity =
        await conversationService.postConversation(request);
    return PostConversationResponse.fromEntity(responseEntity);
  }

  Future<EditConversationResponse> editConversation(
      EditConversationRequest request) async {
    EditConversationResponseEntity responseEntity =
        await conversationService.editConversation(request);
    return EditConversationResponse.fromEntity(responseEntity);
  }

  Future<DeleteConversationResponse> deleteConversation(
      DeleteConversationRequest request) async {
    DeleteConversationResponseEntity responseEntity =
        await conversationService.deleteConversation(request);
    return DeleteConversationResponse.fromEntity(responseEntity);
  }
}
