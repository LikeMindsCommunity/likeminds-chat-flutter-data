class AddPollOptionRequest {
  String poll;
  int conversationId;

  AddPollOptionRequest._({
    required this.poll,
    required this.conversationId,
  });

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'poll': {
        'text': poll,
      },
    };
  }
}

class AddPollOptionRequestBuilder {
  String? _poll;
  int? _conversationId;

  void poll(String poll) {
    _poll = poll;
  }

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  AddPollOptionRequest build() {
    if (_poll == null) {
      throw StateError("Poll is required");
    }
    if (_conversationId == null) {
      throw StateError("Conversation id is required");
    }

    return AddPollOptionRequest._(
      poll: _poll!,
      conversationId: _conversationId!,
    );
  }
}
