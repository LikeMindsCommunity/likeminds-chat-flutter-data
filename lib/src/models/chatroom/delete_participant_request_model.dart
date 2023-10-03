class DeleteParticipantRequest {
  final int chatroomId;
  final bool? isSecret;
  final String memberId;

  DeleteParticipantRequest._({
    required this.chatroomId,
    this.isSecret = false,
    required this.memberId,
  });

  toJson() {
    return {
      'chatroom_id': chatroomId,
      'is_secret': isSecret,
      'member_id': memberId,
    };
  }
}

class DeleteParticipantRequestBuilder {
  int? _chatroomId;
  bool? _isSecret;
  String? _memberId;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void isSecret(bool isSecret) {
    _isSecret = isSecret;
  }

  void memberId(String memberId) {
    _memberId = memberId;
  }

  DeleteParticipantRequest build() {
    return DeleteParticipantRequest._(
      chatroomId: _chatroomId!,
      isSecret: _isSecret,
      memberId: _memberId!,
    );
  }
}
