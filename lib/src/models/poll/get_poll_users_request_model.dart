class GetPollUsersRequest {
  int pollId;
  int conversationId;
  GetPollUsersRequest._({required this.pollId, required this.conversationId});

  Map<String, dynamic> toJson() {
    return {
      'poll_id': pollId,
      'conversation_id': conversationId,
    };
  }
}

class GetPollUsersRequestBuilder {
  int? _pollId;
  int? _conversationId;

  void pollId(int pollId) {
    _pollId = pollId;
  }

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  GetPollUsersRequest build() {
    if (_pollId == null) {
      throw StateError("Poll id is required");
    }
    if (_conversationId == null) {
      throw StateError("Conversation id is required");
    }
    return GetPollUsersRequest._(
      pollId: _pollId!,
      conversationId: _conversationId!,
    );
  }
}
