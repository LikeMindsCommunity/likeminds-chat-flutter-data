import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'create_dm_chatroom_response_model.g.dart';

class CreateDMChatroomResponse {
  final ChatRoom? chatRoom;

  CreateDMChatroomResponse({
    this.chatRoom,
  });

  factory CreateDMChatroomResponse.fromEntity(
      CreateDMChatroomResponseEntity entity) {
    return CreateDMChatroomResponse(
      chatRoom: entity.chatRoomEntity != null
          ? ChatRoom.fromEntity(entity.chatRoomEntity!)
          : null,
    );
  }

  CreateDMChatroomResponseEntity toEntity() {
    return CreateDMChatroomResponseEntity(
      chatRoomEntity: chatRoom?.toEntity(),
    );
  }
}

@JsonSerializable()
class CreateDMChatroomResponseEntity {
  @JsonKey(name: "chatroom")
  final ChatRoomEntity? chatRoomEntity;

  CreateDMChatroomResponseEntity({
    this.chatRoomEntity,
  });

  factory CreateDMChatroomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateDMChatroomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDMChatroomResponseEntityToJson(this);
}
