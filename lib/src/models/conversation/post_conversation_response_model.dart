import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_conversation_response_model.g.dart';

class PostConversationResponse {
  final bool success;
  final String? errorMessage;
  final Conversation? conversation;
  final int? id;

  PostConversationResponse({
    required this.success,
    this.errorMessage,
    this.conversation,
    this.id,
  });

  factory PostConversationResponse.fromEntity(
      PostConversationResponseEntity entity) {
    return PostConversationResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      conversation: entity.conversation != null
          ? Conversation.fromEntity(entity.conversation!)
          : null,
      id: entity.id,
    );
  }

  PostConversationResponseEntity toEntity() {
    return PostConversationResponseEntity(
      success: success,
      errorMessage: errorMessage,
      conversation: conversation != null ? conversation!.toEntity() : null,
      id: id,
    );
  }
}

@JsonSerializable()
class PostConversationResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final ConversationEntity? conversation;
  final int? id;

  PostConversationResponseEntity({
    required this.success,
    this.errorMessage,
    this.conversation,
    this.id,
  });

  factory PostConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PostConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PostConversationResponseEntityToJson(this);
}
