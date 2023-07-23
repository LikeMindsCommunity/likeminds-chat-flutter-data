import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class PostPollConversationResponse {
  final bool success;
  final PollInfoData? data;
  final String? errorMessage;

  PostPollConversationResponse({
    required this.success,
    this.data,
    this.errorMessage,
  });

  factory PostPollConversationResponse.fromEntity(
      PostPollConversationResponseEntity entity) {
    return PostPollConversationResponse(
      success: entity.success,
      data: entity.data != null ? PollInfoData.fromEntity(entity.data!) : null,
      errorMessage: entity.errorMessage,
    );
  }

  PostPollConversationResponseEntity toEntity() {
    return PostPollConversationResponseEntity(
      success: success,
      data: data != null ? data!.toEntity() : null,
      errorMessage: errorMessage,
    );
  }
}

class PostPollConversationResponseEntity {
  final bool success;
  final PollInfoDataEntity? data;
  final String? errorMessage;

  PostPollConversationResponseEntity({
    required this.success,
    this.data,
    this.errorMessage,
  });

  factory PostPollConversationResponseEntity.fromJson(
      Map<String, dynamic> json) {
    return PostPollConversationResponseEntity(
      success: json['success'] as bool,
      data: json['data'] != null
          ? PollInfoDataEntity.fromJson(
              json['data']['poll'] as Map<String, dynamic>)
          : null,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
      'errorMessage': errorMessage,
    };
  }
}
