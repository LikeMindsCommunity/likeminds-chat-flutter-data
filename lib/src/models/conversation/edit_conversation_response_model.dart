import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_conversation_response_model.g.dart';

class EditConversationResponse {
  final Conversation? conversation;

  EditConversationResponse({
    this.conversation,
  });

  factory EditConversationResponse.fromEntity(
      EditConversationResponseEntity entity) {
    return EditConversationResponse(

      conversation: entity.conversation != null
          ? Conversation.fromEntity(entity.conversation!)
          : null,
    );
  }

  EditConversationResponseEntity toEntity() {
    return EditConversationResponseEntity(
      conversation: conversation != null ? conversation!.toEntity() : null,
    );
  }
}

@JsonSerializable()
class EditConversationResponseEntity {
  final ConversationEntity? conversation;

  EditConversationResponseEntity({
    this.conversation,
  });

  factory EditConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EditConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EditConversationResponseEntityToJson(this);
}
