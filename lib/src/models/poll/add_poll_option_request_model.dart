import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class AddPollOptionRequest {
  String poll;
  int conversationId;
  int temporaryId;

  AddPollOptionRequest._({
    required this.poll,
    required this.conversationId,
    required this.temporaryId,
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
  int? _temporaryId;

  void poll(String poll) {
    _poll = poll;
  }

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  void temporaryId(int temporaryId) {
    _temporaryId = temporaryId;
  }

  AddPollOptionRequest build() {
    if (_poll == null) {
      throw StateError("Poll is required");
    }
    if (_conversationId == null) {
      throw StateError("Conversation id is required");
    }

    if (_temporaryId == null) {
      throw StateError("Temporary id is required");
    }

    return AddPollOptionRequest._(
      poll: _poll!,
      conversationId: _conversationId!,
      temporaryId: _temporaryId!,
    );
  }
}
