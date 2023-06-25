import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/chatroom/chatroom_model.dart';

part 'get_explore_feed_response_model.g.dart';

class GetExploreFeedResponse {
  final bool success;
  final String? errorMessage;
  final List<ChatRoom>? chatrooms;
  final int? pinnedChatroomCount;

  GetExploreFeedResponse({
    required this.success,
    this.errorMessage,
    this.chatrooms,
    this.pinnedChatroomCount,
  });

  factory GetExploreFeedResponse.fromEntity(
      GetExploreFeedResponseEntity entity) {
    return GetExploreFeedResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      chatrooms: entity.chatrooms?.map((e) => ChatRoom.fromEntity(e)).toList(),
      pinnedChatroomCount: entity.pinnedChatroomCount,
    );
  }

  GetExploreFeedResponseEntity toEntity() {
    return GetExploreFeedResponseEntity(
      success: success,
      errorMessage: errorMessage,
      chatrooms: chatrooms?.map((e) => e.toEntity()).toList(),
      pinnedChatroomCount: pinnedChatroomCount,
    );
  }
}

@JsonSerializable()
class GetExploreFeedResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final List<ChatRoomEntity>? chatrooms;
  @JsonKey(name: 'pinned_chatroom_count')
  final int? pinnedChatroomCount;

  GetExploreFeedResponseEntity({
    required this.success,
    this.errorMessage,
    this.chatrooms,
    this.pinnedChatroomCount,
  });

  factory GetExploreFeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetExploreFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetExploreFeedResponseEntityToJson(this);
}
