import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'home_feed_response_model.g.dart';

class GetHomeFeedResponse {
  final Map<String, Community>? communityMeta;
  final List<ChatRoom>? chatroomsData;
  final Map<String, Conversation>? conversationMeta;
  final Map<int, User>? userMeta;
  final Map<dynamic, dynamic>? cardAttachmentsMeta;
  final Map<String, List<Attachment>>? conversationAttachmentsMeta;
  final Map<dynamic, dynamic>? conversationPollsMeta;

  GetHomeFeedResponse({
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
      communityMeta: entity.communityMeta
          ?.map((key, value) => MapEntry(key, Community.fromEntity(value))),
      chatroomsData:
          entity.chatroomsData?.map((e) => ChatRoom.fromEntity(e)).toList(),
      conversationMeta: entity.conversationMeta
          ?.map((key, value) => MapEntry(key, Conversation.fromEntity(value))),
      userMeta: entity.userMeta?.map(
        (key, value) => MapEntry(
          key,
          User.fromEntity(value),
        ),
      ),
      cardAttachmentsMeta: entity.cardAttachmentsMeta,
      conversationAttachmentsMeta: entity.conversationAttachmentsMeta?.map(
        (key, value) =>
            MapEntry(key, value.map((e) => Attachment.fromEntity(e)).toList()),
      ),
      conversationPollsMeta: entity.conversationPollsMeta,
    );
  }

  GetHomeFeedResponseEntity toEntity() {
    return GetHomeFeedResponseEntity(
      communityMeta:
          communityMeta?.map((key, value) => MapEntry(key, value.toEntity())),
      chatroomsData: chatroomsData?.map((e) => e.toEntity()).toList(),
      conversationMeta: conversationMeta
          ?.map((key, value) => MapEntry(key, value.toEntity())),
      userMeta: userMeta?.map((key, value) => MapEntry(key, value.toEntity())),
      cardAttachmentsMeta: cardAttachmentsMeta,
      conversationAttachmentsMeta: conversationAttachmentsMeta?.map(
        (key, value) => MapEntry(key, value.map((e) => e.toEntity()).toList()),
      ),
      conversationPollsMeta: conversationPollsMeta,
    );
  }
}

@JsonSerializable()
class GetHomeFeedResponseEntity {
  @JsonKey(name: 'community_meta')
  final Map<String, CommunityEntity>? communityMeta;
  @JsonKey(name: 'chatrooms_data')
  final List<ChatRoomEntity>? chatroomsData;
  @JsonKey(name: 'conversation_meta')
  final Map<String, ConversationEntity>? conversationMeta;
  @JsonKey(name: 'user_meta')
  final Map<int, UserEntity>? userMeta;
  @JsonKey(name: 'card_attachments_meta')
  final Map<dynamic, dynamic>? cardAttachmentsMeta;
  @JsonKey(name: 'conv_attachments_meta')
  final Map<String, List<AttachmentEntity>>? conversationAttachmentsMeta;
  @JsonKey(name: 'conv_polls_meta')
  final Map<dynamic, dynamic>? conversationPollsMeta;

  GetHomeFeedResponseEntity({
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
