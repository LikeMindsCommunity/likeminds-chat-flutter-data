// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_chatroom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyChatRoomEntity _$MyChatRoomEntityFromJson(Map<String, dynamic> json) =>
    MyChatRoomEntity(
      chatRoom: json['chatroom'] == null
          ? null
          : ChatRoomEntity.fromJson(json['chatroom'] as Map<String, dynamic>),
      community: json['community'] == null
          ? null
          : CommunityEntity.fromJson(json['community'] as Map<String, dynamic>),
      conversationUsers: (json['conversation_users'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ChatRoomMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDraft: json['is_draft'] as bool?,
      lastConversationTime: json['last_conversation_time'] as String?,
      memberState: json['member_state'] as int?,
      unseenConversationCount: json['unseen_conversation_count'] as int?,
      memberRightStates: (json['member_right_states'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$MyChatRoomEntityToJson(MyChatRoomEntity instance) =>
    <String, dynamic>{
      'chatroom': instance.chatRoom,
      'community': instance.community,
      'conversation_users': instance.conversationUsers,
      'is_draft': instance.isDraft,
      'last_conversation_time': instance.lastConversationTime,
      'member_state': instance.memberState,
      'unseen_conversation_count': instance.unseenConversationCount,
      'member_right_states': instance.memberRightStates,
    };
