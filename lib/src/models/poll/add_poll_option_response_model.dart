import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class AddPollOptionResponse {
  bool success;
  PollViewData? pollViewData;
  String? errorMessage;

  AddPollOptionResponse({
    required this.success,
    this.pollViewData,
    this.errorMessage,
  });

  factory AddPollOptionResponse.fromEntity(AddPollOptionResponseEntity entity) {
    return AddPollOptionResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      pollViewData: entity.pollViewData != null
          ? PollViewData.fromEntity(entity.pollViewData!)
          : null,
    );
  }

  AddPollOptionResponseEntity toEntity() {
    return AddPollOptionResponseEntity(
      success: success,
      errorMessage: errorMessage,
      pollViewData: pollViewData?.toEntity(),
    );
  }
}

class AddPollOptionResponseEntity {
  bool success;
  String? errorMessage;
  PollViewDataEntity? pollViewData;

  AddPollOptionResponseEntity(
      {required this.success, this.errorMessage, this.pollViewData});

  factory AddPollOptionResponseEntity.fromJson(Map<String, dynamic> json) {
    return AddPollOptionResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'],
      pollViewData: json['data']['poll'] != null
          ? PollViewDataEntity.fromJson(
              json['data']['poll'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error_message': errorMessage,
      'data': pollViewData?.toJson(),
    };
  }
}
