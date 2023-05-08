class DeleteConversationRequest {
  final List<int> conversationIds;
  final String reason;

  DeleteConversationRequest._({
    required this.conversationIds,
    required this.reason,
  });

  toJson() {
    return {
      'conversation_ids': conversationIds,
      'reason': reason,
    };
  }
}

class DeleteConversationRequestBuilder {
  DeleteConversationRequestBuilder();

  List<int>? _conversationIds;
  String? _reason;

  void conversationIds(List<int> conversationIds) =>
      _conversationIds = conversationIds;
  void reason(String reason) => _reason = reason;

  DeleteConversationRequest build() {
    final conversationIds = _conversationIds;
    final reason = _reason;

    if (conversationIds == null) {
      throw StateError('conversationIds is required');
    }
    if (reason == null) {
      throw StateError('reason is required');
    }

    return DeleteConversationRequest._(
      conversationIds: conversationIds,
      reason: reason,
    );
  }
}
