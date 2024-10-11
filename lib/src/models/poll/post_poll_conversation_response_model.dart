import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class PostPollConversationResponse {
  final Conversation? poll;

  PostPollConversationResponse({
    this.poll,
  });

  factory PostPollConversationResponse.fromEntity(
      PostPollConversationResponseEntity entity) {
    return PostPollConversationResponse(
      poll: entity.poll != null ? Conversation.fromEntity(entity.poll!) : null,
    );
  }

  PostPollConversationResponseEntity toEntity() {
    return PostPollConversationResponseEntity(
      poll: poll?.toEntity(),
    );
  }
}

class PostPollConversationResponseEntity {
  final ConversationEntity? poll;

  PostPollConversationResponseEntity({
    this.poll,
  });

  factory PostPollConversationResponseEntity.fromJson(
      Map<String, dynamic> json) {
    return PostPollConversationResponseEntity(
      poll: json['poll'] != null
          ? ConversationEntity.fromJson(json['poll'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'poll': poll?.toJson(),
    };
  }
}
