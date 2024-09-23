import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class SubmitPollRequest {
  int conversationId;
  List<String> polls;

  SubmitPollRequest._({
    required this.conversationId,
    required this.polls,
  });

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'polls': polls,
    };
  }
}

class SubmitPollRequestBuilder {
  int? _conversationId;
  List<String>? _polls;

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  void polls(List<String> polls) {
    _polls = polls;
  }

  SubmitPollRequest build() {
    if (_conversationId == null) {
      throw StateError("Conversation id is required");
    }
    if (_polls == null) {
      throw StateError("Polls is required");
    }
    return SubmitPollRequest._(
      conversationId: _conversationId!,
      polls: _polls!,
    );
  }
}
