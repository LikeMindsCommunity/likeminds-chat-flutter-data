import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class PostPollConversationResponse {
  final PollInfoData? data;

  PostPollConversationResponse({
    this.data,
  });

  factory PostPollConversationResponse.fromEntity(
      PostPollConversationResponseEntity entity) {
    return PostPollConversationResponse(
      data: entity.data != null ? PollInfoData.fromEntity(entity.data!) : null,
    );
  }

  PostPollConversationResponseEntity toEntity() {
    return PostPollConversationResponseEntity(
      data: data != null ? data!.toEntity() : null,
    );
  }
}

class PostPollConversationResponseEntity {
  final PollInfoDataEntity? data;

  PostPollConversationResponseEntity({
    this.data,
  });

  factory PostPollConversationResponseEntity.fromJson(
      Map<String, dynamic> json) {
    return PostPollConversationResponseEntity(
      data: json['poll'] != null
          ? PollInfoDataEntity.fromJson(json['poll'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poll': data?.toJson(),
    };
  }
}
