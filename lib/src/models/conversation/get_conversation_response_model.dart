import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'get_conversation_response_model.g.dart';

class GetConversationResponse {
  final bool success;
  final String? errorMessage;
  final Map<int, ChatRoom>? chatroomMeta;
  final Map<int, Community>? communityMeta;
  final Map<int, User>? userMeta;
  final List<Conversation>? conversationData;

  GetConversationResponse({
    required this.success,
    this.errorMessage,
    this.chatroomMeta,
    this.communityMeta,
    this.userMeta,
    this.conversationData,
  });

  factory GetConversationResponse.fromEntity(
      GetConversationResponseEntity entity) {
    return GetConversationResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      chatroomMeta: entity.chatroomMeta?.map(
        (key, value) => MapEntry(key, ChatRoom.fromEntity(value)),
      ),
      communityMeta: entity.communityMeta?.map(
        (key, value) => MapEntry(key, Community.fromEntity(value)),
      ),
      userMeta: entity.userMeta?.map(
        (key, value) => MapEntry(key, User.fromEntity(value)),
      ),
      conversationData: entity.conversationData
          ?.map((e) => Conversation.fromEntity(e))
          .toList(),
    );
  }

  GetConversationResponseEntity toEntity() {
    return GetConversationResponseEntity(
      success: success,
      errorMessage: errorMessage,
      chatroomMeta: chatroomMeta?.map(
        (key, value) => MapEntry(key, value.toEntity()),
      ),
      communityMeta: communityMeta?.map(
        (key, value) => MapEntry(key, value.toEntity()),
      ),
      userMeta: userMeta?.map(
        (key, value) => MapEntry(key, value.toEntity()),
      ),
      conversationData: conversationData?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetConversationResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'chatroom_meta')
  final Map<int, ChatRoomEntity>? chatroomMeta;
  @JsonKey(name: 'community_meta')
  final Map<int, CommunityEntity>? communityMeta;
  @JsonKey(name: 'user_meta')
  final Map<int, UserEntity>? userMeta;
  @JsonKey(name: 'conversation_data')
  final List<ConversationEntity>? conversationData;

  GetConversationResponseEntity({
    required this.success,
    this.errorMessage,
    this.chatroomMeta,
    this.communityMeta,
    this.userMeta,
    this.conversationData,
  });

  factory GetConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetConversationResponseEntityToJson(this);
}
