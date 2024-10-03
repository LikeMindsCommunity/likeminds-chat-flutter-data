import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class AddPollOptionResponse {
  PollOption? poll;

  AddPollOptionResponse({
    this.poll,
  });

  factory AddPollOptionResponse.fromEntity(AddPollOptionResponseEntity entity) {
    return AddPollOptionResponse(
      poll: entity.pollViewData != null
          ? PollOption.fromEntity(entity.pollViewData!)
          : null,
    );
  }

  AddPollOptionResponseEntity toEntity() {
    return AddPollOptionResponseEntity(
      pollViewData: poll?.toEntity(),
    );
  }
}

class AddPollOptionResponseEntity {
  PollOptionEntity? pollViewData;

  AddPollOptionResponseEntity({
    this.pollViewData,
  });

  factory AddPollOptionResponseEntity.fromJson(Map<String, dynamic> json) {
    return AddPollOptionResponseEntity(
      pollViewData: json['poll'] != null
          ? PollOptionEntity.fromJson(json['poll'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': pollViewData?.toJson(),
    };
  }
}
