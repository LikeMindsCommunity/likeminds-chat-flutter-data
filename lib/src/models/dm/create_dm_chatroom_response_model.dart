import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'create_dm_chatroom_response_model.g.dart';

class CreateDMChatroomResponse {
  final bool success;
  final String? errorMessage;
  final ChatRoom? chatRoom;

  CreateDMChatroomResponse({
    required this.success,
    this.errorMessage,
    this.chatRoom,
  });

  factory CreateDMChatroomResponse.fromEntity(
      CreateDMChatroomResponseEntity entity) {
    return CreateDMChatroomResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      chatRoom: entity.chatRoomEntity != null
          ? ChatRoom.fromEntity(entity.chatRoomEntity!)
          : null,
    );
  }

  CreateDMChatroomResponseEntity toEntity() {
    return CreateDMChatroomResponseEntity(
      success: success,
      errorMessage: errorMessage,
      chatRoomEntity: chatRoom?.toEntity(),
    );
  }
}

@JsonSerializable()
class CreateDMChatroomResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  @JsonKey(name: "chatroom")
  final ChatRoomEntity? chatRoomEntity;

  CreateDMChatroomResponseEntity({
    required this.success,
    this.errorMessage,
    this.chatRoomEntity,
  });

  factory CreateDMChatroomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateDMChatroomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDMChatroomResponseEntityToJson(this);
}
