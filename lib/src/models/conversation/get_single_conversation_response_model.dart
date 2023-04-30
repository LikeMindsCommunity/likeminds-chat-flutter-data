import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/conversation/conversation_model.dart';

part 'get_single_conversation_response_model.g.dart';

class GetSingleConversationResponse {
  final bool success;
  final String? errorMessage;
  final Conversation? conversation;

  GetSingleConversationResponse({
    required this.success,
    this.errorMessage,
    this.conversation,
  });

  factory GetSingleConversationResponse.fromEntity(
      GetSingleConversationResponseEntity entity) {
    return GetSingleConversationResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      conversation: entity.conversation != null
          ? Conversation.fromEntity(entity.conversation!)
          : null,
    );
  }

  GetSingleConversationResponseEntity toEntity() {
    return GetSingleConversationResponseEntity(
      success: success,
      errorMessage: errorMessage,
      conversation: conversation != null ? conversation!.toEntity() : null,
    );
  }
}

@JsonSerializable()
class GetSingleConversationResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final ConversationEntity? conversation;

  GetSingleConversationResponseEntity({
    required this.success,
    this.errorMessage,
    this.conversation,
  });

  factory GetSingleConversationResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetSingleConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSingleConversationResponseEntityToJson(this);
}
