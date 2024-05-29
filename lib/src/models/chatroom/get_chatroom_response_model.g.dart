// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chatroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatroomResponseEntity _$GetChatroomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetChatroomResponseEntity(
      canAccessSecretChatroom:
          json['data']['can_access_secret_chatroom'] as bool?,
      chatroom: json['data']['chatroom'] == null
          ? null
          : ChatRoomEntity.fromJson(
              json['data']['chatroom'] as Map<String, dynamic>),
      chatroomActions: (json['data']['chatroom_actions'] as List<dynamic>?)
          ?.map((e) => ChatroomActionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      community: json['data']['community'] == null
          ? null
          : CommunityEntity.fromJson(
              json['data']['community'] as Map<String, dynamic>),
      conversationUsers: (json['data']['conversation_users'] as List<dynamic>?)
          ?.map((e) => ChatRoomMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastConversationId: json['data']['last_conversation_id'] as int?,
      participantCount: json['data']['participant_count'] as int?,
      unreadMessages: json['data']['unread_messages'] as int?,
    );

Map<String, dynamic> _$GetChatroomResponseEntityToJson(
        GetChatroomResponseEntity instance) =>
    <String, dynamic>{
      'can_access_secret_chatroom': instance.canAccessSecretChatroom,
      'chatroom': instance.chatroom,
      'community': instance.community,
      'conversation_users': instance.conversationUsers,
      'last_conversation_id': instance.lastConversationId,
      'participant_count': instance.participantCount,
      'unread_messages': instance.unreadMessages,
      'chatroom_actions': instance.chatroomActions,
    };
