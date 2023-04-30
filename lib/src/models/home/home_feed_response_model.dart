import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'home_feed_response_model.g.dart';

class GetHomeFeedResponse {
  final bool success;
  final String? errorMessage;
  final Map<String, Community>? communityMeta;
  final List<ChatRoom>? chatroomsData;
  final Map<String, Conversation>? conversationMeta;
  final Map<String, User>? userMeta;
  final Map<dynamic, dynamic>? cardAttachmentsMeta;
  final Map<dynamic, dynamic>? conversationAttachmentsMeta;
  final Map<dynamic, dynamic>? conversationPollsMeta;

  GetHomeFeedResponse({
    required this.success,
    this.errorMessage,
    this.communityMeta,
    this.chatroomsData,
    this.conversationMeta,
    this.userMeta,
    this.cardAttachmentsMeta,
    this.conversationAttachmentsMeta,
    this.conversationPollsMeta,
  });

  factory GetHomeFeedResponse.fromEntity(GetHomeFeedResponseEntity entity) {
    return GetHomeFeedResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      communityMeta: entity.communityMeta != null
          ? entity.communityMeta!
              .map((key, value) => MapEntry(key, Community.fromEntity(value)))
          : null,
      chatroomsData: entity.chatroomsData != null
          ? entity.chatroomsData!.map((e) => ChatRoom.fromEntity(e)).toList()
          : null,
      conversationMeta: entity.conversationMeta != null
          ? entity.conversationMeta!.map(
              (key, value) => MapEntry(key, Conversation.fromEntity(value)))
          : null,
      userMeta: entity.userMeta != null
          ? entity.userMeta!
              .map((key, value) => MapEntry(key, User.fromEntity(value)))
          : null,
      cardAttachmentsMeta: entity.cardAttachmentsMeta,
      conversationAttachmentsMeta: entity.conversationAttachmentsMeta,
      conversationPollsMeta: entity.conversationPollsMeta,
    );
  }

  GetHomeFeedResponseEntity toEntity() {
    return GetHomeFeedResponseEntity(
      success: success,
      errorMessage: errorMessage,
      communityMeta: communityMeta != null
          ? communityMeta!.map((key, value) => MapEntry(key, value.toEntity()))
          : null,
      chatroomsData: chatroomsData != null
          ? chatroomsData!.map((e) => e.toEntity()).toList()
          : null,
      conversationMeta: conversationMeta != null
          ? conversationMeta!
              .map((key, value) => MapEntry(key, value.toEntity()))
          : null,
      userMeta: userMeta != null
          ? userMeta!.map((key, value) => MapEntry(key, value.toEntity()))
          : null,
      cardAttachmentsMeta: cardAttachmentsMeta,
      conversationAttachmentsMeta: conversationAttachmentsMeta,
      conversationPollsMeta: conversationPollsMeta,
    );
  }
}

@JsonSerializable()
class GetHomeFeedResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'community_meta')
  final Map<String, CommunityEntity>? communityMeta;
  @JsonKey(name: 'chatrooms_data')
  final List<ChatRoomEntity>? chatroomsData;
  @JsonKey(name: 'conversation_meta')
  final Map<String, ConversationEntity>? conversationMeta;
  @JsonKey(name: 'user_meta')
  final Map<String, UserEntity>? userMeta;
  @JsonKey(name: 'card_attachments_meta')
  final Map<dynamic, dynamic>? cardAttachmentsMeta;
  @JsonKey(name: 'conv_attachments_meta')
  final Map<dynamic, dynamic>? conversationAttachmentsMeta;
  @JsonKey(name: 'conv_polls_meta')
  final Map<dynamic, dynamic>? conversationPollsMeta;

  GetHomeFeedResponseEntity({
    required this.success,
    this.errorMessage,
    this.communityMeta,
    this.chatroomsData,
    this.conversationMeta,
    this.userMeta,
    this.cardAttachmentsMeta,
    this.conversationAttachmentsMeta,
    this.conversationPollsMeta,
  });

  factory GetHomeFeedResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetHomeFeedResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeFeedResponseEntityToJson(this);
}
