import 'package:likeminds_chat_fl/src/models/conversation/conversation_search_request_model.dart';
import 'package:likeminds_chat_fl/src/models/conversation/conversation_search_response_model.dart';
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

  Future<LMResponse<ConversationSearchResponse>> searchConversation(
      ConversationSearchRequest request) async {
    // Call the service method to get the raw entity
    LMResponse<ConversationSearchResponseEntity> responseEntity =
        await conversationService.searchConversation(request);

    // Handle failure
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }

    // Convert entity to response model and return
    return LMResponse.fromData(
      response: responseEntity,
      data: ConversationSearchResponse.fromEntity(
        responseEntity.data!,
      ),
    );
  }
}
