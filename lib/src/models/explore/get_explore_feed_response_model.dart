import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/chatroom/chatroom_model.dart';

part 'get_explore_feed_response_model.g.dart';

class GetExploreFeedResponse {
  final List<ChatRoom>? chatrooms;
  final int? pinnedChatroomCount;

  GetExploreFeedResponse({
    this.chatrooms,
    this.pinnedChatroomCount,
  });

  factory GetExploreFeedResponse.fromEntity(
      GetExploreFeedResponseEntity entity) {
    return GetExploreFeedResponse(
      chatrooms: entity.chatrooms?.map((e) => ChatRoom.fromEntity(e)).toList(),
      pinnedChatroomCount: entity.pinnedChatroomCount,
    );
  }

  GetExploreFeedResponseEntity toEntity() {
    return GetExploreFeedResponseEntity(
      chatrooms: chatrooms?.map((e) => e.toEntity()).toList(),
      pinnedChatroomCount: pinnedChatroomCount,
    );
  }
}

@JsonSerializable()
class GetExploreFeedResponseEntity {
  final List<ChatRoomEntity>? chatrooms;
  @JsonKey(name: 'pinned_chatrooms_count')
  final int? pinnedChatroomCount;

  GetExploreFeedResponseEntity({
    this.chatrooms,
    this.pinnedChatroomCount,
  });

  factory GetExploreFeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetExploreFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetExploreFeedResponseEntityToJson(this);
}
