import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_conversation_response_model.g.dart';

class DeleteConversationResponse {
  final List<Conversation>? conversations;

  DeleteConversationResponse({
    this.conversations,
  });

  factory DeleteConversationResponse.fromEntity(
      DeleteConversationResponseEntity entity) {
    return DeleteConversationResponse(
      conversations:
          entity.conversations?.map((e) => Conversation.fromEntity(e)).toList(),
    );
  }

  DeleteConversationResponseEntity toEntity() {
    return DeleteConversationResponseEntity(
      conversations: conversations?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class DeleteConversationResponseEntity {
  final List<ConversationEntity>? conversations;

  DeleteConversationResponseEntity({
    this.conversations,
  });

  factory DeleteConversationResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeleteConversationResponseEntityToJson(this);
}
