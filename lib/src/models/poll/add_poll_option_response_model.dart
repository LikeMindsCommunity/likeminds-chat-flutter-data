import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class AddPollOptionResponse {
  bool success;
  PollViewData? pollViewData;
  String? errorMessage;
  int temporaryId;

  AddPollOptionResponse({
    required this.success,
    this.pollViewData,
    this.errorMessage,
    required this.temporaryId,
  });

  factory AddPollOptionResponse.fromEntity(AddPollOptionResponseEntity entity) {
    return AddPollOptionResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      temporaryId: entity.temporaryId,
      pollViewData: entity.pollViewData != null
          ? PollViewData.fromEntity(entity.pollViewData!)
          : null,
    );
  }

  AddPollOptionResponseEntity toEntity() {
    return AddPollOptionResponseEntity(
      success: success,
      errorMessage: errorMessage,
      temporaryId: temporaryId,
      pollViewData: pollViewData?.toEntity(),
    );
  }
}

class AddPollOptionResponseEntity {
  bool success;
  String? errorMessage;
  PollViewDataEntity? pollViewData;
  int temporaryId;

  AddPollOptionResponseEntity({
    required this.success,
    this.errorMessage,
    this.pollViewData,
    required this.temporaryId,
  });

  factory AddPollOptionResponseEntity.fromJson(Map<String, dynamic> json) {
    return AddPollOptionResponseEntity(
      success: json['success'],
      errorMessage: json['error_message'],
      temporaryId: json['temporary_id'],
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
