class MuteChatroomRequest {
  final int chatroomId;
  final bool value;

  MuteChatroomRequest._({
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

class MuteChatroomRequestBuilder {
  int? _chatroomId;
  bool? _value;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void value(bool value) {
    _value = value;
  }

  MuteChatroomRequest build() {
    if (_chatroomId == null) {
      throw StateError("Chatroom id is required");
    }
    if (_value == null) {
      throw StateError("Value is required");
    }
    return MuteChatroomRequest._(
      chatroomId: _chatroomId!,
      value: _value!,
    );
  }
}
