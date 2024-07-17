import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_conversation_response_model.g.dart';

class PostConversationResponse {
  final Conversation? conversation;
  final int? id;

  PostConversationResponse({
    this.conversation,
    this.id,
  });

  factory PostConversationResponse.fromEntity(
      PostConversationResponseEntity entity) {
    return PostConversationResponse(
      conversation: entity.conversation != null
          ? Conversation.fromEntity(entity.conversation!)
          : null,
      id: entity.id,
    );
  }

  PostConversationResponseEntity toEntity() {
    return PostConversationResponseEntity(
      conversation: conversation != null ? conversation!.toEntity() : null,
      id: id,
    );
  }
}

@JsonSerializable()
class PostConversationResponseEntity {
  final ConversationEntity? conversation;
  final int? id;

  PostConversationResponseEntity({
    this.conversation,
    this.id,
  });

  factory PostConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PostConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PostConversationResponseEntityToJson(this);
}
