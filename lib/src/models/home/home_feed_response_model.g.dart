// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeFeedResponseEntity _$GetHomeFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetHomeFeedResponseEntity(
      communityMeta: (json['community_meta'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, CommunityEntity.fromJson(e as Map<String, dynamic>)),
      ),
      chatroomsData: (json['chatrooms_data'] as List<dynamic>?)
          ?.map((e) => ChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      conversationMeta:
          (json['conversation_meta'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, ConversationEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userMeta: (json['user_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      cardAttachmentsMeta:
          json['card_attachments_meta'] as Map<String, dynamic>?,
      conversationAttachmentsMeta:
          (json['conv_attachments_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map(
                    (e) => AttachmentEntity.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      conversationPollsMeta: json['conv_polls_meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GetHomeFeedResponseEntityToJson(
        GetHomeFeedResponseEntity instance) =>
    <String, dynamic>{
      'community_meta': instance.communityMeta,
      'chatrooms_data': instance.chatroomsData,
      'conversation_meta': instance.conversationMeta,
      'user_meta': instance.userMeta?.map((k, e) => MapEntry(k.toString(), e)),
      'card_attachments_meta': instance.cardAttachmentsMeta,
      'conv_attachments_meta': instance.conversationAttachmentsMeta
          ?.map((k, e) => MapEntry(k.toString(), e)),
      'conv_polls_meta': instance.conversationPollsMeta,
    };
