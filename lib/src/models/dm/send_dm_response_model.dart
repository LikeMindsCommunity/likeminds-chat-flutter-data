import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'send_dm_response_model.g.dart';

class SendDMResponse {
  final Conversation? conversation;

  SendDMResponse({
    this.conversation,
  });

  factory SendDMResponse.fromEntity(SendDMResponseEntity entity) {
    return SendDMResponse(
      conversation: entity.conversationEntity != null
          ? Conversation.fromEntity(entity.conversationEntity!)
          : null,
    );
  }

  SendDMResponseEntity toEntity() => SendDMResponseEntity(
        conversationEntity: conversation?.toEntity(),
      );
}

@JsonSerializable()
class SendDMResponseEntity {
  @JsonKey(name: "conversation")
  final ConversationEntity? conversationEntity;

  SendDMResponseEntity({
    this.conversationEntity,
  });

  factory SendDMResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SendDMResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SendDMResponseEntityToJson(this);
}
