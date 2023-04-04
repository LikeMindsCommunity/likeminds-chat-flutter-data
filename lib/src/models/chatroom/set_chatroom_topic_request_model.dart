class SetChatroomTopicRequest {
  final int chatroomId;
  final int conversationId;

  SetChatroomTopicRequest._({
    required this.chatroomId,
    required this.conversationId,
  });

  toJson() {
    return {
      'chatroom_id': chatroomId,
      'conversation_id': conversationId,
    };
  }
}

class SetChatroomTopicRequestBuilder {
  int? _chatroomId;
  int? _conversationId;

  SetChatroomTopicRequestBuilder();

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  SetChatroomTopicRequest build() {
    return SetChatroomTopicRequest._(
      chatroomId: _chatroomId!,
      conversationId: _conversationId!,
    );
  }
}
