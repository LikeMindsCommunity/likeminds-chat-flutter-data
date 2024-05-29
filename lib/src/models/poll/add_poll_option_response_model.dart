import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class AddPollOptionResponse {
  PollViewData? pollViewData;
  int temporaryId;

  AddPollOptionResponse({
    this.pollViewData,
    required this.temporaryId,
  });

  factory AddPollOptionResponse.fromEntity(AddPollOptionResponseEntity entity) {
    return AddPollOptionResponse(
      temporaryId: entity.temporaryId,
      pollViewData: entity.pollViewData != null
          ? PollViewData.fromEntity(entity.pollViewData!)
          : null,
    );
  }

  AddPollOptionResponseEntity toEntity() {
    return AddPollOptionResponseEntity(
      temporaryId: temporaryId,
      pollViewData: pollViewData?.toEntity(),
    );
  }
}

class AddPollOptionResponseEntity {
  PollViewDataEntity? pollViewData;
  int temporaryId;

  AddPollOptionResponseEntity({
    this.pollViewData,
    required this.temporaryId,
  });

  factory AddPollOptionResponseEntity.fromJson(Map<String, dynamic> json) {
    return AddPollOptionResponseEntity(
      temporaryId: json['temporary_id'],
      pollViewData: json['poll'] != null
          ? PollViewDataEntity.fromJson(json['poll'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': pollViewData?.toJson(),
    };
  }
}
