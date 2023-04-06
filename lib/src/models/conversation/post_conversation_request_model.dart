class PostConversationRequest {
  final String text;
  final int chatroomId;
  final int expiryTime;
  final String? replyId;

  PostConversationRequest._({
    required this.text,
    required this.chatroomId,
    required this.expiryTime,
    this.replyId,
  });

  toJson() {
    return {
      'text': text,
      'chatroom_id': chatroomId,
      'expiry_time': expiryTime,
      'reply_id': replyId,
    };
  }
}

class PostConversationRequestBuilder {
  PostConversationRequestBuilder();

  String? _text;
  int? _chatroomId;
  int? _expiryTime;
  String? _replyId;

  void text(String text) => _text = text;
  void chatroomId(int chatroomId) => _chatroomId = chatroomId;
  void expiryTime(int expiryTime) => _expiryTime = expiryTime;
  void replyId(String? replyId) => _replyId = replyId;

  PostConversationRequest build() {
    final text = _text;
    final chatroomId = _chatroomId;
    final expiryTime = _expiryTime;
    final replyId = _replyId;

    if (text == null) {
      throw StateError('Message text is required');
    }
    if (chatroomId == null) {
      throw StateError('chatroomId is required');
    }
    if (expiryTime == null) {
      throw StateError('expiryTime is required');
    }

    return PostConversationRequest._(
      text: text,
      chatroomId: chatroomId,
      expiryTime: expiryTime,
      replyId: replyId,
    );
  }
}
