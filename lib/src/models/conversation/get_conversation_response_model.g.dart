// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConversationResponseEntity _$GetConversationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetConversationResponseEntity(
      chatroomMeta: (json['chatroom_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), ChatRoomEntity.fromJson(e as Map<String, dynamic>)),
      ),
      communityMeta: (json['community_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), CommunityEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userMeta: (json['user_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      conversationData: (json['conversations_data'] as List<dynamic>?)
          ?.map((e) => ConversationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      conversationAttachmentsMeta:
          (json['conv_attachments_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map(
                    (e) => AttachmentEntity.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      conversationReactionsMeta:
          (json['conv_reactions_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => ReactionEntity.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      conversationMeta:
          (json['conversation_meta'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ConversationEntity.fromJson(e as Map<String, dynamic>)),
      ),
      conversationPollsMeta: (json['conv_polls_meta'] as Map<String, dynamic>?)
          ?.map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((v) => PollOptionEntity.fromJson(v as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$GetConversationResponseEntityToJson(
        GetConversationResponseEntity instance) =>
    <String, dynamic>{
      'chatroom_meta':
          instance.chatroomMeta?.map((k, e) => MapEntry(k.toString(), e)),
      'community_meta':
          instance.communityMeta?.map((k, e) => MapEntry(k.toString(), e)),
      'user_meta': instance.userMeta?.map((k, e) => MapEntry(k.toString(), e)),
      'conversations_data': instance.conversationData,
      'conversation_meta': instance.conversationMeta,
      'conv_reaction_meta': instance.conversationReactionsMeta,
      'conv_attachments_meta': instance.conversationAttachmentsMeta,
    };
