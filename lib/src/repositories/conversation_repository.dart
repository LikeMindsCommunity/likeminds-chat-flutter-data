import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/conversation_service.dart';

class ConversationRepository {
  final ConversationService conversationService;

  ConversationRepository({required this.conversationService});

  Future<LMResponse<GetConversationResponse>> getConversation(
      GetConversationRequest request) async {
    LMResponse<GetConversationResponseEntity> responseEntity =
        await conversationService.getConversation(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: GetConversationResponse.fromEntity(
        responseEntity.data!,
      ),
    );
  }

  Future<LMResponse<PostConversationResponse>> postConversation(
      PostConversationRequest request) async {
    LMResponse<PostConversationResponseEntity> responseEntity =
        await conversationService.postConversation(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: PostConversationResponse.fromEntity(
        responseEntity.data!,
      ),
    );
  }

  Future<LMResponse<EditConversationResponse>> editConversation(
      EditConversationRequest request) async {
    LMResponse<EditConversationResponseEntity> responseEntity =
        await conversationService.editConversation(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: EditConversationResponse.fromEntity(
        responseEntity.data!,
      ),
    );
  }

  Future<LMResponse<DeleteConversationResponse>> deleteConversation(
      DeleteConversationRequest request) async {
    LMResponse<DeleteConversationResponseEntity> responseEntity =
        await conversationService.deleteConversation(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: DeleteConversationResponse.fromEntity(
        responseEntity.data!,
      ),
    );
  }
}
