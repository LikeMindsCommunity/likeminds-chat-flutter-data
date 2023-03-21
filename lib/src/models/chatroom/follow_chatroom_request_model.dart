class FollowChatroomRequest {
  final int chatroomId;
  final bool value;

  FollowChatroomRequest({
    required this.chatroomId,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'chatroom_id': chatroomId,
      'value': value,
    };
  }
}
