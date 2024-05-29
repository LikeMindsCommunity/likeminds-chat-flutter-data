import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'get_conversation_response_model.g.dart';

class GetConversationResponse {
  final Map<int, ChatRoom>? chatroomMeta;
  final Map<int, Community>? communityMeta;
  final Map<int, User>? userMeta;
  final List<Conversation>? conversationData;
  final Map<String, Conversation>? conversationMeta;
  final Map<String, dynamic>? conversationAttachmentsMeta;

  GetConversationResponse({

    this.chatroomMeta,
    this.communityMeta,
    this.userMeta,
    this.conversationData,
    this.conversationMeta,
    this.conversationAttachmentsMeta,
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
      conversationAttachmentsMeta: entity.conversationAttachmentsMeta,
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
      conversationAttachmentsMeta: conversationAttachmentsMeta,
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
  @JsonKey(name: 'conversation_data')
  final List<ConversationEntity>? conversationData;
  @JsonKey(name: 'conversation_meta')
  final Map<String, ConversationEntity>? conversationMeta;
  @JsonKey(name: 'conv_attachments_meta')
  final Map<String, dynamic>? conversationAttachmentsMeta;

  GetConversationResponseEntity({
    this.chatroomMeta,
    this.communityMeta,
    this.userMeta,
    this.conversationData,
    this.conversationAttachmentsMeta,
    this.conversationMeta,
  });

  factory GetConversationResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetConversationResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetConversationResponseEntityToJson(this);
}
