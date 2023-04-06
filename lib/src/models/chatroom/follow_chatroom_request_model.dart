class FollowChatroomRequest {
  final int chatroomId;
  final int memberId;
  final bool value;

  FollowChatroomRequest({
    required this.chatroomId,
    required this.memberId,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      // Collabcard to be changed to chatroom, and
      // member id support to be removed.
      'collabcard_id': chatroomId,
      'member_id': memberId,
      'value': value,
    };
  }
}
