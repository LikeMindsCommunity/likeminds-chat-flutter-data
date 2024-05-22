import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'send_dm_response_model.g.dart';

class SendDMResponse {
  final bool success;
  final String? errorMessage;
  final Conversation? conversation;

  SendDMResponse({
    required this.success,
    this.errorMessage,
    this.conversation,
  });

  factory SendDMResponse.fromEntity(SendDMResponseEntity entity) {
    return SendDMResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      conversation: entity.conversationEntity != null
          ? Conversation.fromEntity(entity.conversationEntity!)
          : null,
    );
  }

  SendDMResponseEntity toEntity() => SendDMResponseEntity(
        success: success,
        errorMessage: errorMessage,
        conversationEntity: conversation?.toEntity(),
      );
}

@JsonSerializable()
class SendDMResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  @JsonKey(name: "conversation")
  final ConversationEntity? conversationEntity;

  SendDMResponseEntity({
    required this.success,
    this.errorMessage,
    this.conversationEntity,
  });

  factory SendDMResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SendDMResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SendDMResponseEntityToJson(this);
}
