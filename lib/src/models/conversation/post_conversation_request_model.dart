class PostConversationRequest {
  final String text;
  final int chatroomId;
  final int? expiryTime;
  final String? replyId;
  final String temporaryId;
  final bool hasFiles;
  final int attachmentCount;

  PostConversationRequest._({
    required this.text,
    required this.chatroomId,
    required this.temporaryId,
    this.expiryTime,
    this.replyId,
    required this.hasFiles,
    this.attachmentCount = 0,
  });

  toJson() {
    return {
      'text': text,
      'chatroom_id': chatroomId,
      'expiry_time': expiryTime,
      'reply_id': replyId,
      'temporary_id': temporaryId,
      'has_files': hasFiles,
      'attachment_count': attachmentCount,
    };
  }
}

class PostConversationRequestBuilder {
  PostConversationRequestBuilder();

  String? _text;
  int? _chatroomId;
  int? _expiryTime;
  String? _replyId;
  String? _temporaryId;
  bool? _hasFiles;
  int? _attachmentCount;

  void text(String text) => _text = text;
  void chatroomId(int chatroomId) => _chatroomId = chatroomId;
  void expiryTime(int expiryTime) => _expiryTime = expiryTime;
  void replyId(String? replyId) => _replyId = replyId;
  void temporaryId(String temporaryId) => _temporaryId = temporaryId;
  void hasFiles(bool hasFiles) => _hasFiles = hasFiles;
  void attachmentCount(int attachmentCount) =>
      _attachmentCount = attachmentCount;

  PostConversationRequest build() {
    final text = _text;
    final chatroomId = _chatroomId;
    final expiryTime = _expiryTime;
    final replyId = _replyId;
    final temporaryId = _temporaryId;

    if (text == null) {
      throw StateError('Message text is required');
    }
    if (chatroomId == null) {
      throw StateError('chatroomId is required');
    }
    if (temporaryId == null) {
      throw StateError('temporaryId is required');
    }
    return PostConversationRequest._(
      text: text,
      chatroomId: chatroomId,
      expiryTime: expiryTime,
      replyId: replyId,
      temporaryId: temporaryId,
      attachmentCount: _attachmentCount ?? 0,
      hasFiles: _hasFiles ?? false,
    );
  }
}
