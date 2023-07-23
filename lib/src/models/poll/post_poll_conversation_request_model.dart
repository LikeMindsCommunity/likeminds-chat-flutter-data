import 'package:likeminds_chat_fl/src/models/models.dart';

class PostPollConversationRequest {
  final int chatroomId;
  final String text;
  final int state;
  final String? repliedConversationId;
  final List<PollOption> polls;
  final int pollType;
  final int? multipleSelectState;
  final int? multipleSelectNo;
  final bool isAnonymous;
  final bool allowAddOption;
  final int expiryTime;
  final String temporaryId;

  PostPollConversationRequest._({
    required this.chatroomId,
    required this.text,
    required this.state,
    this.repliedConversationId,
    required this.polls,
    required this.pollType,
    this.multipleSelectState,
    this.multipleSelectNo,
    required this.isAnonymous,
    required this.allowAddOption,
    required this.expiryTime,
    required this.temporaryId,
  });

  Map<String, dynamic> toJson() => {
        'chatroom_id': chatroomId,
        'text': text,
        'state': state,
        'replied_conversation_id': repliedConversationId,
        'polls': polls.map((e) => e.toEntity().toJson()).toList(),
        'poll_type': pollType,
        'multiple_select_state': multipleSelectState,
        'multiple_select_no': multipleSelectNo,
        'is_anonymous': isAnonymous,
        'allow_add_option': allowAddOption,
        'expiry_time': expiryTime,
        'temporary_id': temporaryId,
      };
}

class PostPollConversationRequestBuilder {
  int? _chatroomId;
  String? _text;
  int? _state;
  String? _repliedConversationId;
  List<PollOption>? _polls;
  int? _pollType;
  int? _multipleSelectState;
  int? _multipleSelectNo;
  bool? _isAnonymous;
  bool? _allowAddOption;
  int? _expiryTime;
  String? _temporaryId;

  PostPollConversationRequestBuilder();

  PostPollConversationRequestBuilder chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
    return this;
  }

  PostPollConversationRequestBuilder text(String text) {
    _text = text;
    return this;
  }

  PostPollConversationRequestBuilder state(int state) {
    _state = state;
    return this;
  }

  PostPollConversationRequestBuilder repliedConversationId(
      String repliedConversationId) {
    _repliedConversationId = repliedConversationId;
    return this;
  }

  PostPollConversationRequestBuilder polls(List<PollOption> polls) {
    _polls = polls;
    return this;
  }

  PostPollConversationRequestBuilder pollType(int pollType) {
    _pollType = pollType;
    return this;
  }

  PostPollConversationRequestBuilder multipleSelectState(
      int multipleSelectState) {
    _multipleSelectState = multipleSelectState;
    return this;
  }

  PostPollConversationRequestBuilder multipleSelectNo(int? multipleSelectNo) {
    _multipleSelectNo = multipleSelectNo;
    return this;
  }

  PostPollConversationRequestBuilder isAnonymous(bool isAnonymous) {
    _isAnonymous = isAnonymous;
    return this;
  }

  PostPollConversationRequestBuilder allowAddOption(bool allowAddOption) {
    _allowAddOption = allowAddOption;
    return this;
  }

  PostPollConversationRequestBuilder expiryTime(int expiryTime) {
    _expiryTime = expiryTime;
    return this;
  }

  PostPollConversationRequestBuilder temporaryId(String temporaryId) {
    _temporaryId = temporaryId;
    return this;
  }

  PostPollConversationRequest build() {
    return PostPollConversationRequest._(
      chatroomId: _chatroomId!,
      text: _text!,
      state: _state!,
      polls: _polls!,
      pollType: _pollType!,
      isAnonymous: _isAnonymous!,
      allowAddOption: _allowAddOption!,
      expiryTime: _expiryTime!,
      temporaryId: _temporaryId!,
      multipleSelectNo: _multipleSelectNo,
      multipleSelectState: _multipleSelectState,
      repliedConversationId: _repliedConversationId,
    );
  }
}
