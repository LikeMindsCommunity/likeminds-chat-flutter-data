class DeleteParticipantRequest {
  final int chatroomId;
  final bool? isSecret;

  DeleteParticipantRequest._({
    required this.chatroomId,
    this.isSecret = false,
  });

  toJson() {
    return {
      'chatroom_id': chatroomId,
      'is_secret': isSecret,
    };
  }
}

class DeleteParticipantRequestBuilder {
  int? _chatroomId;
  bool? _isSecret;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void isSecret(bool isSecret) {
    _isSecret = isSecret;
  }

  DeleteParticipantRequest build() {
    return DeleteParticipantRequest._(
      chatroomId: _chatroomId!,
      isSecret: _isSecret,
    );
  }
}
