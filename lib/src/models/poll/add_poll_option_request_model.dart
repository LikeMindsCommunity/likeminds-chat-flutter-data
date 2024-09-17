import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class AddPollOptionRequest {
  PollOption pollViewData;
  int conversationId;
  int temporaryId;

  AddPollOptionRequest._({
    required this.pollViewData,
    required this.conversationId,
    required this.temporaryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'poll': {
        'text': pollViewData.text,
      },
    };
  }
}

class AddPollOptionRequestBuilder {
  PollOption? _pollViewData;
  int? _conversationId;
  int? _temporaryId;

  void pollViewData(PollOption pollViewData) {
    _pollViewData = pollViewData;
  }

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  void temporaryId(int temporaryId) {
    _temporaryId = temporaryId;
  }

  AddPollOptionRequest build() {
    if (_pollViewData == null) {
      throw StateError("Poll view data is required");
    }
    if (_conversationId == null) {
      throw StateError("Conversation id is required");
    }

    if (_temporaryId == null) {
      throw StateError("Temporary id is required");
    }

    return AddPollOptionRequest._(
      pollViewData: _pollViewData!,
      conversationId: _conversationId!,
      temporaryId: _temporaryId!,
    );
  }
}
