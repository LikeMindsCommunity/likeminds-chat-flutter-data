class GetSingleConversationRequest {
  final int chatroomId;
  final int conversationId;

  GetSingleConversationRequest._({
    required this.chatroomId,
    required this.conversationId,
  });

  toJson() {
    return {
      "chatroom_id": chatroomId,
      "conversation_id": conversationId,
      "meta": "true",
    };
  }
}

class GetSingleConversationRequestBuilder {
  int? _chatroomId;
  int? _conversationId;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  GetSingleConversationRequest build() {
    return GetSingleConversationRequest._(
      chatroomId: _chatroomId!,
      conversationId: _conversationId!,
    );
  }
}
