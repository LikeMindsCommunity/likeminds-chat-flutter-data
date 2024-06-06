import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'get_chatroom_response_model.g.dart';

class GetChatroomResponse {
  final bool? canAccessSecretChatroom;
  final ChatRoom? chatroom;
  final List<ChatroomAction>? chatroomActions;
  final Community? community;
  final List<ChatRoomMember>? conversationUsers;
  final int? lastConversationId;
  final int? participantCount;
  final int? unreadMessages;

  GetChatroomResponse({
    this.canAccessSecretChatroom,
    this.chatroom,
    this.community,
    this.conversationUsers,
    this.lastConversationId,
    this.participantCount,
    this.unreadMessages,
    this.chatroomActions,
  });

  factory GetChatroomResponse.fromEntity(GetChatroomResponseEntity entity) {
    return GetChatroomResponse(
      canAccessSecretChatroom: entity.canAccessSecretChatroom,
      chatroom: entity.chatroom != null
          ? ChatRoom.fromEntity(entity.chatroom!)
          : null,
      chatroomActions: entity.chatroomActions
          ?.map((e) => ChatroomAction.fromEntity(e))
          .toList(),
      community: entity.community != null
          ? Community.fromEntity(entity.community!)
          : null,
      conversationUsers: entity.conversationUsers
          ?.map((e) => ChatRoomMember.fromEntity(e))
          .toList(),
      lastConversationId: entity.lastConversationId,
      participantCount: entity.participantCount,
      unreadMessages: entity.unreadMessages,
    );
  }

  GetChatroomResponseEntity toEntity() {
    return GetChatroomResponseEntity(
      canAccessSecretChatroom: canAccessSecretChatroom,
      chatroom: chatroom?.toEntity(),
      chatroomActions: chatroomActions?.map((e) => e.toEntity()).toList(),
      community: community?.toEntity(),
      conversationUsers: conversationUsers?.map((e) => e.toEntity()).toList(),
      lastConversationId: lastConversationId,
      participantCount: participantCount,
      unreadMessages: unreadMessages,
    );
  }
}

@JsonSerializable()
class GetChatroomResponseEntity {
  @JsonKey(name: 'can_access_secret_chatroom')
  final bool? canAccessSecretChatroom;
  @JsonKey(name: 'chatroom')
  final ChatRoomEntity? chatroom;
  @JsonKey(name: 'chatroom_actions')
  final List<ChatroomActionEntity>? chatroomActions;
  @JsonKey(name: 'community')
  final CommunityEntity? community;
  @JsonKey(name: 'conversation_users')
  final List<ChatRoomMemberEntity>? conversationUsers;
  @JsonKey(name: 'last_conversation_id')
  final int? lastConversationId;
  @JsonKey(name: 'participant_count')
  final int? participantCount;
  @JsonKey(name: 'unread_messages')
  final int? unreadMessages;

  GetChatroomResponseEntity({
    this.canAccessSecretChatroom,
    this.chatroom,
    this.chatroomActions,
    this.community,
    this.conversationUsers,
    this.lastConversationId,
    this.participantCount,
    this.unreadMessages,
  });

  factory GetChatroomResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetChatroomResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetChatroomResponseEntityToJson(this);
}
