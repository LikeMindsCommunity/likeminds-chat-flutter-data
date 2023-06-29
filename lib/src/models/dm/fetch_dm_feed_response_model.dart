import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'fetch_dm_feed_response_model.g.dart';

class FetchDMFeedResponse {
  final bool success;
  final String? errorMessage;
  final List<ChatRoom>? dmChatrooms;
  final int? totalPages;

  FetchDMFeedResponse({
    required this.success,
    this.errorMessage,
    this.dmChatrooms,
    this.totalPages,
  });

  factory FetchDMFeedResponse.fromEntity(FetchDMFeedResponseEntity entity) {
    return FetchDMFeedResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      dmChatrooms:
          entity.dmChatrooms?.map((e) => ChatRoom.fromEntity(e)).toList(),
      totalPages: entity.totalPages,
    );
  }

  FetchDMFeedResponseEntity toEntity() {
    return FetchDMFeedResponseEntity(
      success: success,
      errorMessage: errorMessage,
      dmChatrooms: dmChatrooms?.map((e) => e.toEntity()).toList(),
      totalPages: totalPages,
    );
  }
}

@JsonSerializable()
class FetchDMFeedResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'dm_chatrooms')
  final List<ChatRoomEntity>? dmChatrooms;
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  FetchDMFeedResponseEntity({
    required this.success,
    this.errorMessage,
    this.dmChatrooms,
    this.totalPages,
  });

  factory FetchDMFeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$FetchDMFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FetchDMFeedResponseEntityToJson(this);
}
