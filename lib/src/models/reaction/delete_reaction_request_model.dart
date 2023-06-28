class DeleteReactionRequest {
  final int conversationId;
  final String reaction;

  DeleteReactionRequest._({
    required this.conversationId,
    required this.reaction,
  });

  Map<String, dynamic> toJson() => {
        'conversation_id': conversationId,
        'reaction': reaction,
      };
}

class DeleteReactionRequestBuilder {
  int? _conversationId;
  String? _reaction;

  DeleteReactionRequestBuilder();

  DeleteReactionRequestBuilder conversationId(int conversationId) {
    _conversationId = conversationId;
    return this;
  }

  DeleteReactionRequestBuilder reaction(String reaction) {
    _reaction = reaction;
    return this;
  }

  DeleteReactionRequest build() {
    assert(_conversationId != null);
    assert(_reaction != null);
    return DeleteReactionRequest._(
      conversationId: _conversationId!,
      reaction: _reaction!,
    );
  }
}
