class MuteChatroomRequest {
  final int chatroomId;
  final bool value;

  MuteChatroomRequest({
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
