class MarkReadChatroomRequest {
  final int chatroomId;

  MarkReadChatroomRequest._({required this.chatroomId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatroom_id'] = chatroomId.toString();
    return data;
  }
}

class MarkReadChatroomRequestBuilder {
  int? _chatroomId;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  MarkReadChatroomRequest build() {
    if (_chatroomId == null) {
      throw StateError("Chatroom id is required");
    }
    return MarkReadChatroomRequest._(
      chatroomId: _chatroomId!,
    );
  }
}
