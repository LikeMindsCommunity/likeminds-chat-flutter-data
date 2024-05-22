class BlockMemberRequest {
  int chatroomId;
  int status;

  BlockMemberRequest._({
    required this.chatroomId,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        "chatroom_id": chatroomId,
        "status": status,
      };
}

class BlockMemberRequestBuilder {
  BlockMemberRequestBuilder();

  int? _chatroomId;
  int? _status;

  void chatroomId(int chatroomId) => _chatroomId = chatroomId;
  void status(int status) => _status = status;

  BlockMemberRequest build() {
    if (_chatroomId == null) {
      throw StateError("chatroomId is required");
    }
    if (_status == null) {
      throw StateError("status is required");
    }

    return BlockMemberRequest._(
      chatroomId: _chatroomId!,
      status: _status!,
    );
  }
}
