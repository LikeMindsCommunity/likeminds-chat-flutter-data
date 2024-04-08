class SendDMRequest {
  int chatroomId;
  int chatRequestState;
  String text;

  SendDMRequest._({
    required this.chatroomId,
    required this.chatRequestState,
    required this.text,
  });

  Map<String, dynamic> toJson() => {
        "chatroom_id": chatroomId,
        "chat_request_state": chatRequestState,
        "text": text,
      };
}

class SendDMRequestBuilder {
  SendDMRequestBuilder();
  int? _chatroomId;
  int? _chatRequestState;
  String? _text;

  void chatroomId(int chatroomId) => _chatroomId = chatroomId;
  void chatRequestState(int chatRequestState) =>
      _chatRequestState = chatRequestState;
  void text(String text) => _text = text;

  SendDMRequest build() {
    if (_chatroomId == null) {
      throw StateError("chatroomId is required");
    }
    if (_chatRequestState == null) {
      throw StateError("chatRequestState is required");
    }
    if (_text == null) {
      throw StateError("text is required");
    }
    return SendDMRequest._(
      chatroomId: _chatroomId!,
      chatRequestState: _chatRequestState!,
      text: _text!,
    );
  }
}
