import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
part 'block_member_response_model.g.dart';

class BlockMemberResponse {
  final bool success;
  final String? errorMessage;
  final Conversation? conversation;

  BlockMemberResponse({
    required this.success,
    required this.errorMessage,
    required this.conversation,
  });

  factory BlockMemberResponse.fromEntity(BlockMemberResponseEntity entity) {
    return BlockMemberResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      conversation: entity.conversationEntity != null
          ? Conversation.fromEntity(entity.conversationEntity!)
          : null,
    );
  }

  BlockMemberResponseEntity toEntity() {
    return BlockMemberResponseEntity(
      success: success,
      errorMessage: errorMessage,
      conversationEntity: conversation?.toEntity(),
    );
  }
}

@JsonSerializable()
class BlockMemberResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  @JsonKey(name: "conversation")
  final ConversationEntity? conversationEntity;

  BlockMemberResponseEntity({
    required this.success,
    this.errorMessage,
    this.conversationEntity,
  });

  factory BlockMemberResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BlockMemberResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BlockMemberResponseEntityToJson(this);
}
