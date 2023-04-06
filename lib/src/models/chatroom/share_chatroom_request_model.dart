class ShareChatroomRequest {
  final int chatroomId;
  final String domain;

  ShareChatroomRequest._({
    required this.chatroomId,
    required this.domain,
  });

  toJson() {
    return {
      'chatroom_id': chatroomId,
      'domain': domain,
    };
  }
}

class ShareChatroomRequestBuilder {
  int? _chatroomId;
  String? _domain;

  ShareChatroomRequestBuilder();

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void domain(String domain) {
    _domain = domain;
  }

  ShareChatroomRequest build() {
    return ShareChatroomRequest._(
      chatroomId: _chatroomId!,
      domain: _domain!,
    );
  }
}
