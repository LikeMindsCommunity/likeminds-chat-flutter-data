class PutReactionRequest {
  int conversationId;
  String reaction;

  PutReactionRequest._({
    required this.conversationId,
    required this.reaction,
  });

  Map<String, dynamic> toJson() => {
        'conversation_id': conversationId,
        'reaction': reaction,
      };
}

class PutReactionRequestBuilder {
  int? _conversationId;
  String? _reaction;

  PutReactionRequestBuilder();

  PutReactionRequestBuilder conversationId(int conversationId) {
    _conversationId = conversationId;
    return this;
  }

  PutReactionRequestBuilder reaction(String reaction) {
    _reaction = reaction;
    return this;
  }

  PutReactionRequest build() {
    return PutReactionRequest._(
      conversationId: _conversationId!,
      reaction: _reaction!,
    );
  }
}
