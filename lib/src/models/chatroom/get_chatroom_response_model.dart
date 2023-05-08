import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'get_chatroom_response_model.g.dart';

class GetChatroomResponse {
  final bool success;
  final String? errorMessage;
  final bool? canAccessSecretChatroom;
  final ChatRoom? chatroom;
  final List<ChatroomAction>? chatroomActions;
  final Community? community;
  final List<ChatRoomMember>? conversationUsers;
  final int? lastConversationId;
  final int? participantCount;
  final int? unreadMessages;

  GetChatroomResponse({
    required this.success,
    this.errorMessage,
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
      success: entity.success,
      errorMessage: entity.errorMessage,
      canAccessSecretChatroom: entity.canAccessSecretChatroom,
      chatroom: entity.chatroom != null
          ? ChatRoom.fromEntity(entity.chatroom!)
          : null,
      chatroomActions: entity.chatroomActions != null
          ? entity.chatroomActions!
              .map((e) => ChatroomAction.fromEntity(e))
              .toList()
          : null,
      community: entity.community != null
          ? Community.fromEntity(entity.community!)
          : null,
      conversationUsers: entity.conversationUsers != null
          ? entity.conversationUsers!
              .map((e) => ChatRoomMember.fromEntity(e))
              .toList()
          : null,
      lastConversationId: entity.lastConversationId,
      participantCount: entity.participantCount,
      unreadMessages: entity.unreadMessages,
    );
  }

  GetChatroomResponseEntity toEntity() {
    return GetChatroomResponseEntity(
      success: success,
      errorMessage: errorMessage,
      canAccessSecretChatroom: canAccessSecretChatroom,
      chatroom: chatroom != null ? chatroom!.toEntity() : null,
      chatroomActions: chatroomActions != null
          ? chatroomActions!.map((e) => e.toEntity()).toList()
          : null,
      community: community != null ? community!.toEntity() : null,
      conversationUsers: conversationUsers != null
          ? conversationUsers!.map((e) => e.toEntity()).toList()
          : null,
      lastConversationId: lastConversationId,
      participantCount: participantCount,
      unreadMessages: unreadMessages,
    );
  }
}

@JsonSerializable()
class GetChatroomResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
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
    required this.success,
    this.errorMessage,
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
