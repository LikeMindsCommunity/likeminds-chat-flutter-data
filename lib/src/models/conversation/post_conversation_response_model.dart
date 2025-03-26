import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_conversation_response_model.g.dart';

class PostConversationResponse {
  final Conversation? conversation;
  final int? id;
  final Map<String, LMWidgetData>? widgets;

  PostConversationResponse({
    this.conversation,
    this.id,
    this.widgets,
  });

  factory PostConversationResponse.fromEntity(
      PostConversationResponseEntity entity) {
    return PostConversationResponse(
      conversation: entity.conversation != null
          ? Conversation.fromEntity(entity.conversation!)
          : null,
      id: entity.id,
      widgets: entity.widgets?.map(
        (key, value) {
          return MapEntry(key, LMWidgetData.fromEntity(value));
        },
      ),
    );
  }

  PostConversationResponseEntity toEntity() {
    return PostConversationResponseEntity(
      conversation: conversation?.toEntity(),
      id: id,
      widgets: widgets?.map(
        (key, value) {
          return MapEntry(key, value.toEntity());
        },
      ),
    );
  }
}

@JsonSerializable()
class PostConversationResponseEntity {
  final ConversationEntity? conversation;
  final int? id;
  final Map<String, LMWidgetDataEntity>? widgets;

  PostConversationResponseEntity({
    this.conversation,
    this.id,
    this.widgets,
  });

  factory PostConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PostConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PostConversationResponseEntityToJson(this);
}
