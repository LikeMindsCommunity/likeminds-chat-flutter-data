import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/chatroom/chatroom_member_model.dart';
import 'package:likeminds_chat_fl/src/models/chatroom/chatroom_model.dart';
import 'package:likeminds_chat_fl/src/models/community/community_model.dart';

part 'my_chatroom_model.g.dart';

class MyChatRoom {
  final ChatRoom? chatRoom;
  final Community? community;
  final List<ChatRoomMember?>? conversationUsers;
  final bool? isDraft;
  final String? lastConversationTime;
  final int? memberState;
  final int? unseenConversationCount;
  final List<int>? memberRightStates;

  MyChatRoom({
    this.chatRoom,
    this.community,
    this.conversationUsers,
    this.isDraft,
    this.lastConversationTime,
    this.memberState,
    this.unseenConversationCount,
    this.memberRightStates,
  });

  factory MyChatRoom.fromEntity(MyChatRoomEntity entity) {
    return MyChatRoom(
      chatRoom: entity.chatRoom != null
          ? ChatRoom.fromEntity(entity.chatRoom!)
          : null,
      community: entity.community != null
          ? Community.fromEntity(entity.community!)
          : null,
      conversationUsers: entity.conversationUsers != null
          ? entity.conversationUsers!
              .map((e) => ChatRoomMember.fromEntity(e!))
              .toList()
          : null,
      isDraft: entity.isDraft,
      lastConversationTime: entity.lastConversationTime,
      memberState: entity.memberState,
      unseenConversationCount: entity.unseenConversationCount,
      memberRightStates: entity.memberRightStates,
    );
  }

  MyChatRoomEntity toEntity() {
    return MyChatRoomEntity(
      chatRoom: chatRoom != null ? chatRoom!.toEntity() : null,
      community: community != null ? community!.toEntity() : null,
      conversationUsers: conversationUsers != null
          ? conversationUsers!.map((e) => e?.toEntity()).toList()
          : null,
      isDraft: isDraft,
      lastConversationTime: lastConversationTime,
      memberState: memberState,
      unseenConversationCount: unseenConversationCount,
      memberRightStates: memberRightStates,
    );
  }
}

@JsonSerializable()
class MyChatRoomEntity {
  @JsonKey(name: 'chatroom')
  final ChatRoomEntity? chatRoom;
  final CommunityEntity? community;
  @JsonKey(name: 'conversation_users')
  final List<ChatRoomMemberEntity?>? conversationUsers;
  @JsonKey(name: 'is_draft')
  final bool? isDraft;
  @JsonKey(name: 'last_conversation_time')
  final String? lastConversationTime;
  @JsonKey(name: 'member_state')
  final int? memberState;
  @JsonKey(name: 'unseen_conversation_count')
  final int? unseenConversationCount;
  @JsonKey(name: 'member_right_states')
  final List<int>? memberRightStates;

  MyChatRoomEntity({
    this.chatRoom,
    this.community,
    this.conversationUsers,
    this.isDraft,
    this.lastConversationTime,
    this.memberState,
    this.unseenConversationCount,
    this.memberRightStates,
  });

  factory MyChatRoomEntity.fromJson(Map<String, dynamic> json) =>
      _$MyChatRoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MyChatRoomEntityToJson(this);
}
