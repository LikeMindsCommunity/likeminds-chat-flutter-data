import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/home/my_chatroom_model.dart';

part 'home_feed_response_model.g.dart';

class GetHomeFeedResponse {
  final bool success;
  final String? errorMessage;
  final List<MyChatRoom>? myChatRooms;
  final int? totalChatRoomCount;
  final int? totalUnseenCount;
  final int? totalPages;
  final int? unseenChatRoomCount;

  GetHomeFeedResponse({
    required this.success,
    this.errorMessage,
    this.myChatRooms,
    this.totalChatRoomCount,
    this.totalUnseenCount,
    this.totalPages,
    this.unseenChatRoomCount,
  });

  factory GetHomeFeedResponse.fromEntity(GetHomeFeedResponseEntity entity) {
    return GetHomeFeedResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      myChatRooms: entity.myChatRooms != null
          ? entity.myChatRooms!.map((e) => MyChatRoom.fromEntity(e)).toList()
          : null,
      totalChatRoomCount: entity.totalChatRoomCount,
      totalUnseenCount: entity.totalUnseenCount,
      totalPages: entity.totalPages,
      unseenChatRoomCount: entity.unseenChatRoomCount,
    );
  }

  toEntity() {
    return GetHomeFeedResponseEntity(
      success: success,
      errorMessage: errorMessage,
      myChatRooms: myChatRooms != null
          ? myChatRooms!.map((e) => e.toEntity()).toList()
          : null,
      totalChatRoomCount: totalChatRoomCount,
      totalUnseenCount: totalUnseenCount,
      totalPages: totalPages,
      unseenChatRoomCount: unseenChatRoomCount,
    );
  }
}

@JsonSerializable()
class GetHomeFeedResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'my_chatrooms')
  final List<MyChatRoomEntity>? myChatRooms;
  @JsonKey(name: 'total_chatroom_count')
  final int? totalChatRoomCount;
  @JsonKey(name: 'total_unseen_count')
  final int? totalUnseenCount;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'unseen_chatroom_count')
  final int? unseenChatRoomCount;

  GetHomeFeedResponseEntity({
    required this.success,
    this.errorMessage,
    this.myChatRooms,
    this.totalChatRoomCount,
    this.totalUnseenCount,
    this.totalPages,
    this.unseenChatRoomCount,
  });

  factory GetHomeFeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetHomeFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeFeedResponseEntityToJson(this);
}
