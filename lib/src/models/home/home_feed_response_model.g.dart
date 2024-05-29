// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeFeedResponseEntity _$GetHomeFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetHomeFeedResponseEntity(
      communityMeta:
          (json['data']['community_meta'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, CommunityEntity.fromJson(e as Map<String, dynamic>)),
      ),
      chatroomsData: (json['data']['chatrooms_data'] as List<dynamic>?)
          ?.map((e) => ChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      conversationMeta:
          (json['data']['conversation_meta'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ConversationEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userMeta: (json['data']['user_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      cardAttachmentsMeta:
          json['data']['card_attachments_meta'] as Map<String, dynamic>?,
      conversationAttachmentsMeta:
          json['data']['conv_attachments_meta'] as Map<String, dynamic>?,
      conversationPollsMeta:
          json['data']['conv_polls_meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetHomeFeedResponseEntityToJson(
        GetHomeFeedResponseEntity instance) =>
    <String, dynamic>{
      'community_meta': instance.communityMeta,
      'chatrooms_data': instance.chatroomsData,
      'conversation_meta': instance.conversationMeta,
      'user_meta': instance.userMeta,
      'card_attachments_meta': instance.cardAttachmentsMeta,
      'conv_attachments_meta': instance.conversationAttachmentsMeta,
      'conv_polls_meta': instance.conversationPollsMeta,
    };
