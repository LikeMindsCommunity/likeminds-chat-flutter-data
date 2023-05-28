class FollowChatroomRequest {
  final int chatroomId;
  final int? memberId;
  final bool value;

  FollowChatroomRequest._({
    required this.chatroomId,
    this.memberId,
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

class FollowChatroomRequestBuilder {
  int? _chatroomId;
  int? _memberId;
  bool? _value;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void memberId(int memberId) {
    _memberId = memberId;
  }

  void value(bool value) {
    _value = value;
  }

  FollowChatroomRequest build() {
    if (_chatroomId == null) {
      throw StateError("Chatroom id is required");
    }
    if (_value == null) {
      throw StateError("Value is required");
    }
    return FollowChatroomRequest._(
      chatroomId: _chatroomId!,
      memberId: _memberId,
      value: _value!,
    );
  }
}
