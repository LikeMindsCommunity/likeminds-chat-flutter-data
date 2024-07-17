import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
part 'block_member_response_model.g.dart';

class BlockMemberResponse {
  final Conversation? conversation;

  BlockMemberResponse({
    required this.conversation,
  });

  factory BlockMemberResponse.fromEntity(BlockMemberResponseEntity entity) {
    return BlockMemberResponse(
      conversation: entity.conversationEntity != null
          ? Conversation.fromEntity(entity.conversationEntity!)
          : null,
    );
  }

  BlockMemberResponseEntity toEntity() {
    return BlockMemberResponseEntity(
      conversationEntity: conversation?.toEntity(),
    );
  }
}

@JsonSerializable()
class BlockMemberResponseEntity {
  @JsonKey(name: "conversation")
  final ConversationEntity? conversationEntity;

  BlockMemberResponseEntity({
    this.conversationEntity,
  });

  factory BlockMemberResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BlockMemberResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BlockMemberResponseEntityToJson(this);
}
