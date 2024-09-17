import 'package:likeminds_chat_fl/src/models/poll/poll_option.dart';

class Poll {
  final bool? isAnonymous;
  final bool? allowAddOption;
  final int? pollType;
  final String? pollTypeText;
  final String? submitTypeText;
  final int? expiryTime;
  final int? multipleSelectNum;
  final int? multipleSelectState;
  final List<PollOption>? pollOptions;
  final String? pollAnswerText;
  final bool? isPollSubmitted;
  bool? toShowResult;
  final int? conversationId;

  Poll({
    this.isAnonymous,
    this.allowAddOption,
    this.pollType,
    this.pollTypeText,
    this.submitTypeText,
    this.expiryTime,
    this.multipleSelectNum,
    this.multipleSelectState,
    this.pollOptions,
    this.pollAnswerText,
    this.isPollSubmitted,
    this.toShowResult,
    this.conversationId,
  });

  factory Poll.fromEntity(PollEntity entity) {
    return Poll(
        isAnonymous: entity.isAnonymous,
        allowAddOption: entity.allowAddOption,
        pollType: entity.pollType,
        pollTypeText: entity.pollTypeText,
        submitTypeText: entity.submitTypeText,
        expiryTime: entity.expiryTime,
        multipleSelectNum: entity.multipleSelectNum,
        multipleSelectState: entity.multipleSelectState,
        pollOptions:
            entity.pollOptions?.map((e) => PollOption.fromEntity(e)).toList(),
        pollAnswerText: entity.pollAnswerText,
        isPollSubmitted: entity.isPollSubmitted,
        toShowResult: entity.toShowResult,
        conversationId: entity.conversationId);
  }

  PollEntity toEntity() {
    return PollEntity(
      isAnonymous: isAnonymous,
      allowAddOption: allowAddOption,
      pollType: pollType,
      pollTypeText: pollTypeText,
      submitTypeText: submitTypeText,
      expiryTime: expiryTime,
      multipleSelectNum: multipleSelectNum,
      multipleSelectState: multipleSelectState,
      pollOptions: pollOptions?.map((e) => e.toEntity()).toList(),
      pollAnswerText: pollAnswerText,
      isPollSubmitted: isPollSubmitted,
      toShowResult: toShowResult,
    );
  }
}

class PollEntity {
  final bool? isAnonymous;
  final bool? allowAddOption;
  final int? pollType;
  final String? pollTypeText;
  final String? submitTypeText;
  final int? expiryTime;
  final int? multipleSelectNum;
  final int? multipleSelectState;
  final List<PollOptionEntity>? pollOptions;
  final String? pollAnswerText;
  final bool? isPollSubmitted;
  final bool? toShowResult;
  final int? conversationId;

  PollEntity({
    this.isAnonymous,
    this.allowAddOption,
    this.pollType,
    this.pollTypeText,
    this.submitTypeText,
    this.expiryTime,
    this.multipleSelectNum,
    this.multipleSelectState,
    this.pollOptions,
    this.pollAnswerText,
    this.isPollSubmitted,
    this.toShowResult,
    this.conversationId,
  });

  factory PollEntity.fromJson(Map<String, dynamic> json) {
    return PollEntity(
      isAnonymous: json['is_anonymous'],
      allowAddOption: json['allow_add_option'],
      pollType: json['poll_type'],
      pollTypeText: json['poll_type_text'],
      submitTypeText: json['submit_type_text'],
      expiryTime: json['expiry_time'],
      multipleSelectNum: json['multiple_select_no'],
      multipleSelectState: json['multiple_select_state'],
      pollOptions: json['poll_view_data_list'] != null
          ? List<PollOptionEntity>.from(json['poll_view_data_list']
              .map((data) => PollOptionEntity.fromJson(data)))
          : null,
      pollAnswerText: json['poll_answer_text'],
      isPollSubmitted: false,
      toShowResult: json['to_show_results'],
      conversationId: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'is_anonymous': isAnonymous,
      'allow_add_option': allowAddOption,
      'poll_type': pollType,
      'poll_type_text': pollTypeText,
      'submit_type_text': submitTypeText,
      'expiry_time': expiryTime,
      'multiple_select_no': multipleSelectNum,
      'multiple_select_state': multipleSelectState,
      'poll_answer_text': pollAnswerText,
      'isPollSubmitted': isPollSubmitted,
      'to_show_results': toShowResult,
      'id': conversationId,
    };
    if (pollOptions != null) {
      data['poll_view_data_list'] =
          pollOptions!.map((data) => data.toJson()).toList();
    }
    return data;
  }
}
