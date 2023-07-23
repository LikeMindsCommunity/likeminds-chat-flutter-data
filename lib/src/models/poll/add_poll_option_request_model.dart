import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class AddPollOptionRequest {
  PollViewData pollViewData;
  int conversationId;

  AddPollOptionRequest._({
    required this.pollViewData,
    required this.conversationId,
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
  PollViewData? _pollViewData;
  int? _conversationId;

  void pollViewData(PollViewData pollViewData) {
    _pollViewData = pollViewData;
  }

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  AddPollOptionRequest build() {
    if (_pollViewData == null) {
      throw StateError("Poll view data is required");
    }
    if (_conversationId == null) {
      throw StateError("Conversation id is required");
    }
    return AddPollOptionRequest._(
      pollViewData: _pollViewData!,
      conversationId: _conversationId!,
    );
  }
}
