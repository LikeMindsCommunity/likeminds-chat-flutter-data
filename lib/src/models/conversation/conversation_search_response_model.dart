import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'conversation_search_response_model.g.dart';

class ConversationSearchResponse {
  final List<Conversation>? conversations;
  final Map<String, LMWidgetData>? widgets;

  ConversationSearchResponse({
    required this.conversations,
    required this.widgets,
  });
  factory ConversationSearchResponse.fromEntity(
      ConversationSearchResponseEntity entity) {
    return ConversationSearchResponse(
      conversations:
          entity.conversations?.map((e) => Conversation.fromEntity(e)).toList(),
      widgets: entity.widgets?.map(
        (key, value) => MapEntry(key, LMWidgetData.fromEntity(value)),
      ),
    );
  }

  ConversationSearchResponseEntity toEntity() {
    return ConversationSearchResponseEntity(
      conversations: conversations?.map((e) => e.toEntity()).toList(),
      widgets: widgets?.map(
        (key, value) => MapEntry(key, value.toEntity()),
      ),
    );
  }
}

@JsonSerializable()
class ConversationSearchResponseEntity {
  @JsonKey(name: "conversations")
  List<ConversationEntity>? conversations;
  @JsonKey(name: "widgets")
  final Map<String, LMWidgetDataEntity>? widgets;

  
  ConversationSearchResponseEntity({required this.conversations,required this.widgets});

    factory ConversationSearchResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ConversationSearchResponseEntityFromJson(json);


  Map<String, dynamic> toJson() => _$ConversationSearchResponseEntityToJson(this);

}
