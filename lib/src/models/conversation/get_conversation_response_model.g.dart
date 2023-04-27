// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConversationResponseEntity _$GetConversationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetConversationResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      chatroomMeta:
          (json['data']['chatroom_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), ChatRoomEntity.fromJson(e as Map<String, dynamic>)),
      ),
      communityMeta:
          (json['data']['community_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), CommunityEntity.fromJson(e as Map<String, dynamic>)),
      ),
      userMeta: (json['data']['user_meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), UserEntity.fromJson(e as Map<String, dynamic>)),
      ),
      conversationData: (json['data']['conversations_data'] as List<dynamic>?)
          ?.map((e) => ConversationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetConversationResponseEntityToJson(
        GetConversationResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'chatroom_meta':
          instance.chatroomMeta?.map((k, e) => MapEntry(k.toString(), e)),
      'community_meta':
          instance.communityMeta?.map((k, e) => MapEntry(k.toString(), e)),
      'user_meta': instance.userMeta?.map((k, e) => MapEntry(k.toString(), e)),
      'conversations_data': instance.conversationData,
    };
