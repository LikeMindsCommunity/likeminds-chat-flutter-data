import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'fetch_dm_feed_response_model.g.dart';

class FetchDMFeedResponse {
  final List<ChatRoom>? dmChatRooms;
  final int? totalPages;

  FetchDMFeedResponse({
    this.dmChatRooms,
    this.totalPages,
  });

  factory FetchDMFeedResponse.fromEntity(FetchDMFeedResponseEntity entity) {
    return FetchDMFeedResponse(
      dmChatRooms:
          entity.dmChatRooms?.map((e) => ChatRoom.fromEntity(e)).toList(),
      totalPages: entity.totalPages,
    );
  }

  FetchDMFeedResponseEntity toEntity() {
    return FetchDMFeedResponseEntity(
      dmChatRooms: dmChatRooms?.map((e) => e.toEntity()).toList(),
      totalPages: totalPages,
    );
  }
}

@JsonSerializable()
class FetchDMFeedResponseEntity {
  @JsonKey(name: 'dm_chatrooms')
  final List<ChatRoomEntity>? dmChatRooms;
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  FetchDMFeedResponseEntity({
    this.dmChatRooms,
    this.totalPages,
  });

  factory FetchDMFeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$FetchDMFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FetchDMFeedResponseEntityToJson(this);
}
