import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_conversation_response_model.g.dart';

class DeleteConversationResponse {
  final bool success;
  final String? errorMessage;
  final List<Conversation>? conversations;

  DeleteConversationResponse({
    required this.success,
    this.errorMessage,
    this.conversations,
  });

  factory DeleteConversationResponse.fromEntity(
      DeleteConversationResponseEntity entity) {
    return DeleteConversationResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      conversations: entity.conversations != null
          ? entity.conversations!
              .map((e) => Conversation.fromEntity(e))
              .toList()
          : null,
    );
  }

  DeleteConversationResponseEntity toEntity() {
    return DeleteConversationResponseEntity(
      success: success,
      errorMessage: errorMessage,
      conversations: conversations != null
          ? conversations!.map((e) => e.toEntity()).toList()
          : null,
    );
  }
}

@JsonSerializable()
class DeleteConversationResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<ConversationEntity>? conversations;

  DeleteConversationResponseEntity({
    required this.success,
    this.errorMessage,
    this.conversations,
  });

  factory DeleteConversationResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeleteConversationResponseEntityToJson(this);
}
