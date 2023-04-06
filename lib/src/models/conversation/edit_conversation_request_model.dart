class EditConversationRequest {
  final String text;
  final int conversationId;

  EditConversationRequest._({
    required this.text,
    required this.conversationId,
  });

  toJson() {
    return {
      'text': text,
      'conversation_id': conversationId,
    };
  }
}

class EditConversationRequestBuilder {
  EditConversationRequestBuilder();

  String? _text;
  int? _conversationId;

  void text(String text) => _text = text;
  void conversationId(int conversationId) => _conversationId = conversationId;

  EditConversationRequest build() {
    final text = _text;
    final conversationId = _conversationId;

    if (text == null) {
      throw StateError('Message text is required');
    }
    if (conversationId == null) {
      throw StateError('conversationId is required');
    }

    return EditConversationRequest._(
      text: text,
      conversationId: conversationId,
    );
  }
}
