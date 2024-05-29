// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chatroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatroomResponseEntity _$GetChatroomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetChatroomResponseEntity(
      canAccessSecretChatroom: json['can_access_secret_chatroom'] as bool?,
      chatroom: json['chatroom'] == null
          ? null
          : ChatRoomEntity.fromJson(json['chatroom'] as Map<String, dynamic>),
      chatroomActions: (json['chatroom_actions'] as List<dynamic>?)
          ?.map((e) => ChatroomActionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      community: json['community'] == null
          ? null
          : CommunityEntity.fromJson(json['community'] as Map<String, dynamic>),
      conversationUsers: (json['conversation_users'] as List<dynamic>?)
          ?.map((e) => ChatRoomMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastConversationId: (json['last_conversation_id'] as num?)?.toInt(),
      participantCount: (json['participant_count'] as num?)?.toInt(),
      unreadMessages: (json['unread_messages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetChatroomResponseEntityToJson(
        GetChatroomResponseEntity instance) =>
    <String, dynamic>{
      'can_access_secret_chatroom': instance.canAccessSecretChatroom,
      'chatroom': instance.chatroom,
      'chatroom_actions': instance.chatroomActions,
      'community': instance.community,
      'conversation_users': instance.conversationUsers,
      'last_conversation_id': instance.lastConversationId,
      'participant_count': instance.participantCount,
      'unread_messages': instance.unreadMessages,
    };
