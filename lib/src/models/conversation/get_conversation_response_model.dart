import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'get_conversation_response_model.g.dart';

class GetConversationResponse {
  final Map<int, ChatRoom>? chatroomMeta;
  final Map<int, Community>? communityMeta;
  final Map<int, User>? userMeta;
  final List<Conversation>? conversationData;
  final Map<String, Conversation>? conversationMeta;
  final Map<String, List<Reaction>>? conversationReactionMeta;
  final Map<String, List<Attachment>>? conversationAttachmentsMeta;
  final Map<String, List<PollOption>>? conversationPollsMeta;
  final Map<String, LMWidgetData>? widgets;

  GetConversationResponse({
    this.chatroomMeta,
    this.communityMeta,
    this.userMeta,
    this.conversationData,
    this.conversationMeta,
    this.conversationReactionMeta,
    this.conversationAttachmentsMeta,
    this.conversationPollsMeta,
    this.widgets,
  });

  factory GetConversationResponse.fromEntity(
      GetConversationResponseEntity entity) {
    return GetConversationResponse(
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
      conversationMeta: entity.conversationMeta?.map(
        (key, value) => MapEntry(key, Conversation.fromEntity(value)),
      ),
      conversationReactionMeta: entity.conversationReactionsMeta?.map(
        (key, value) => MapEntry(
          key,
          value.map((e) => Reaction.fromEntity(e)).toList(),
        ),
      ),
      conversationAttachmentsMeta: entity.conversationAttachmentsMeta?.map(
        (key, value) => MapEntry(
          key,
          value.map((e) => Attachment.fromEntity(e)).toList(),
        ),
      ),
      conversationPollsMeta: entity.conversationPollsMeta?.map(
        (key, value) => MapEntry(
          key,
          value.map((e) => PollOption.fromEntity(e)).toList(),
        ),
      ),
      widgets: entity.widgets?.map(
        (key, value) => MapEntry(key, LMWidgetData.fromEntity(value)),
      ),
    );
  }

  GetConversationResponseEntity toEntity() {
    return GetConversationResponseEntity(
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
      conversationMeta: conversationMeta?.map(
        (key, value) => MapEntry(key, value.toEntity()),
      ),
      conversationReactionsMeta: conversationReactionMeta?.map(
        (key, value) => MapEntry(
          key,
          value.map((e) => e.toEntity()).toList(),
        ),
      ),
      conversationAttachmentsMeta: conversationAttachmentsMeta?.map(
        (key, value) => MapEntry(
          key,
          value.map((e) => e.toEntity()).toList(),
        ),
      ),
      conversationPollsMeta: conversationPollsMeta?.map(
        (key, value) => MapEntry(
          key,
          value.map((e) => e.toEntity()).toList(),
        ),
      ),
      widgets: widgets?.map(
        (key, value) => MapEntry(key, value.toEntity()),
      ),
    );
  }
}

@JsonSerializable()
class GetConversationResponseEntity {
  @JsonKey(name: 'chatroom_meta')
  final Map<int, ChatRoomEntity>? chatroomMeta;
  @JsonKey(name: 'community_meta')
  final Map<int, CommunityEntity>? communityMeta;
  @JsonKey(name: 'user_meta')
  final Map<int, UserEntity>? userMeta;
  @JsonKey(name: 'conversations_data')
  final List<ConversationEntity>? conversationData;
  @JsonKey(name: 'conversation_meta')
  final Map<String, ConversationEntity>? conversationMeta;
  @JsonKey(name: 'conv_reactions_meta')
  final Map<String, List<ReactionEntity>>? conversationReactionsMeta;
  @JsonKey(name: 'conv_attachments_meta')
  final Map<String, List<AttachmentEntity>>? conversationAttachmentsMeta;
  @JsonKey(name: 'conv_polls_meta')
  final Map<String, List<PollOptionEntity>>? conversationPollsMeta;
  @JsonKey(name: 'widgets')
  final Map<String, LMWidgetDataEntity>? widgets;

  GetConversationResponseEntity({
    this.chatroomMeta,
    this.communityMeta,
    this.userMeta,
    this.conversationData,
    this.conversationReactionsMeta,
    this.conversationAttachmentsMeta,
    this.conversationMeta,
    this.conversationPollsMeta,
    this.widgets,
  });

  factory GetConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetConversationResponseEntityToJson(this);
}
