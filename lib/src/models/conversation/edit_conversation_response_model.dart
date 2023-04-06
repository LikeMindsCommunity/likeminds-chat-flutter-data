import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_conversation_response_model.g.dart';

class EditConversationResponse {
  final bool success;
  final String? errorMessage;
  final Conversation? conversation;

  EditConversationResponse({
    required this.success,
    this.errorMessage,
    this.conversation,
  });

  factory EditConversationResponse.fromEntity(
      EditConversationResponseEntity entity) {
    return EditConversationResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      conversation: entity.conversation != null
          ? Conversation.fromEntity(entity.conversation!)
          : null,
    );
  }

  EditConversationResponseEntity toEntity() {
    return EditConversationResponseEntity(
      success: success,
      errorMessage: errorMessage,
      conversation: conversation != null ? conversation!.toEntity() : null,
    );
  }
}

@JsonSerializable()
class EditConversationResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final ConversationEntity? conversation;

  EditConversationResponseEntity({
    required this.success,
    this.errorMessage,
    this.conversation,
  });

  factory EditConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$EditConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EditConversationResponseEntityToJson(this);
}
