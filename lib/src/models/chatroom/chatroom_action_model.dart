import 'package:json_annotation/json_annotation.dart';

part 'chatroom_action_model.g.dart';

class ChatroomAction {
  final int id;
  String title;

  ChatroomAction({
    required this.id,
    required this.title,
  });

  factory ChatroomAction.fromEntity(ChatroomActionEntity entity) {
    return ChatroomAction(
      id: entity.id,
      title: entity.title,
    );
  }

  ChatroomActionEntity toEntity() {
    return ChatroomActionEntity(
      id: id,
      title: title,
    );
  }
}

@JsonSerializable()
class ChatroomActionEntity {
  final int id;
  final String title;

  ChatroomActionEntity({
    required this.id,
    required this.title,
  });

  factory ChatroomActionEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatroomActionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChatroomActionEntityToJson(this);
}
