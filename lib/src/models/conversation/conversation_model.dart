import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'conversation_model.g.dart';

class Conversation {
  final bool? allowAddOption;
  String answer;
  final int? apiVersion;
  final int? attachmentCount;
  List<Attachment>? attachments;
  final bool? attachmentsUploaded;
  final int? chatroomId;
  final int? communityId;
  final String createdAt;
  final int? createdEpoch;
  final String? date;
  int? deletedByUserId;
  final String? deviceId;
  final int? endTime;
  final int? expiryTime;
  final bool? hasFiles;
  bool? hasReactions;
  final String? header;
  final int id;
  final String? internalLink;
  final bool? isAnonymous;
  bool? isEdited;
  int? lastUpdated;
  final String? location;
  final String? locationLat;
  final String? locationLong;
  final int? multipleSelectNo;
  final int? multipleSelectState;
  final OgTags? ogTags;
  final int? onlineLinkEnableBefore;
  final String? pollAnswerText;
  final int? pollType;
  final int? replyChatroomId;
  final int? replyId;
  final int? startTime;
  final int? state;
  final String? temporaryId;
  final int? memberId;
  final bool? toShowResults;
  final String? pollTypeText;
  final String? submitTypeText;
  final bool? isTimeStamp;
  User? member;
  final int? replyConversation;
  Conversation? replyConversationObject;
  List<Reaction>? conversationReactions;
  List<PollOption>? polls;
  final bool? noPollExpiry;
  final bool? allowVoteChange;

  Conversation({
    this.allowAddOption,
    required this.answer,
    this.apiVersion,
    this.attachmentCount,
    this.attachmentsUploaded,
    this.attachments,
    this.chatroomId,
    this.communityId,
    required this.createdAt,
    this.createdEpoch,
    this.date,
    this.deletedByUserId,
    this.deviceId,
    this.endTime,
    this.expiryTime,
    this.hasFiles,
    this.hasReactions,
    required this.header,
    required this.id,
    this.internalLink,
    this.isAnonymous,
    this.isEdited,
    this.lastUpdated,
    this.location,
    this.locationLat,
    this.locationLong,
    this.multipleSelectNo,
    this.multipleSelectState,
    this.ogTags,
    this.onlineLinkEnableBefore,
    this.pollAnswerText,
    this.pollType,
    this.replyChatroomId,
    this.replyId,
    this.startTime,
    this.state,
    this.temporaryId,
    this.memberId,
    this.toShowResults,
    this.pollTypeText,
    this.submitTypeText,
    this.isTimeStamp,
    this.member,
    this.replyConversation,
    this.replyConversationObject,
    this.conversationReactions,
    this.polls,
    this.noPollExpiry,
    this.allowVoteChange,
  });

  factory Conversation.fromEntity(ConversationEntity entity) {
    return Conversation(
      allowAddOption: entity.allowAddOption,
      answer: entity.answer,
      apiVersion: entity.apiVersion,
      attachmentCount: entity.attachmentCount,
      attachmentsUploaded: entity.attachmentsUploaded,
      chatroomId: entity.chatroomId,
      communityId: entity.communityId,
      createdAt: entity.createdAt,
      createdEpoch: entity.createdEpoch,
      date: entity.date,
      attachments:
          entity.attachments?.map((e) => Attachment.fromEntity(e)).toList(),
      deletedByUserId: entity.deletedByUserId,
      deviceId: entity.deviceId,
      endTime: entity.endTime,
      expiryTime: entity.expiryTime,
      hasFiles: entity.hasFiles,
      hasReactions: entity.hasReactions,
      header: entity.header,
      id: entity.id,
      internalLink: entity.internalLink,
      isAnonymous: entity.isAnonymous,
      isEdited: entity.isEdited,
      lastUpdated: entity.lastUpdated,
      location: entity.location,
      locationLat: entity.locationLat,
      locationLong: entity.locationLong,
      multipleSelectNo: entity.multipleSelectNo,
      multipleSelectState: entity.multipleSelectState,
      ogTags: entity.ogTags != null ? OgTags.fromEntity(entity.ogTags!) : null,
      onlineLinkEnableBefore: entity.onlineLinkEnableBefore,
      pollAnswerText: entity.pollAnswerText,
      pollType: entity.pollType,
      replyChatroomId: entity.replyChatroomId,
      replyId: entity.replyId,
      replyConversation: entity.replyConversation,
      replyConversationObject: entity.replyConversationObject != null
          ? Conversation.fromEntity(entity.replyConversationObject!)
          : null,
      startTime: entity.startTime,
      state: entity.state,
      temporaryId: entity.temporaryId,
      toShowResults: entity.toShowResults,
      pollTypeText: entity.pollTypeText,
      submitTypeText: entity.submitTypeText,
      memberId: entity.memberId,
      member: entity.member != null ? User.fromEntity(entity.member!) : null,
      conversationReactions: entity.conversationReactionsEntity
          ?.map((e) => Reaction.fromEntity(e))
          .toList(),
      polls: entity.polls?.map((e) => PollOption.fromEntity(e)).toList(),
      noPollExpiry: entity.noPollExpiry,
      allowVoteChange: entity.allowVoteChange,
    );
  }

  ConversationEntity toEntity() {
    return ConversationEntity(
      allowAddOption: allowAddOption,
      answer: answer,
      apiVersion: apiVersion,
      attachmentCount: attachmentCount,
      attachments: attachments?.map((e) => e.toEntity()).toList(),
      attachmentsUploaded: attachmentsUploaded,
      chatroomId: chatroomId,
      communityId: communityId,
      createdAt: createdAt,
      createdEpoch: createdEpoch,
      date: date,
      deletedByUserId: deletedByUserId,
      deviceId: deviceId,
      endTime: endTime,
      expiryTime: expiryTime,
      hasFiles: hasFiles,
      hasReactions: hasReactions,
      header: header,
      id: id,
      internalLink: internalLink,
      member: member?.toEntity(),
      isAnonymous: isAnonymous,
      isEdited: isEdited,
      lastUpdated: lastUpdated,
      location: location,
      locationLat: locationLat,
      locationLong: locationLong,
      multipleSelectNo: multipleSelectNo,
      multipleSelectState: multipleSelectState,
      ogTags: ogTags?.toEntity(),
      onlineLinkEnableBefore: onlineLinkEnableBefore,
      pollAnswerText: pollAnswerText,
      pollType: pollType,
      replyChatroomId: replyChatroomId,
      replyId: replyId,
      replyConversation: replyConversation,
      replyConversationObject: replyConversationObject?.toEntity(),
      startTime: startTime,
      state: state,
      temporaryId: temporaryId,
      toShowResults: toShowResults,
      pollTypeText: pollTypeText,
      submitTypeText: submitTypeText,
      memberId: memberId,
      conversationReactionsEntity:
          conversationReactions?.map((e) => e.toEntity()).toList(),
      polls: polls?.map((e) => e.toEntity()).toList(),
      noPollExpiry: noPollExpiry,
      allowVoteChange: allowVoteChange,
    );
  }
}

@JsonSerializable()
class ConversationEntity {
  @JsonKey(name: 'allow_add_option')
  final bool? allowAddOption;
  final String answer;
  @JsonKey(name: 'api_version')
  final int? apiVersion;
  @JsonKey(name: 'attachment_count')
  final int? attachmentCount;
  final List<AttachmentEntity>? attachments;
  @JsonKey(name: 'attachments_uploaded')
  final bool? attachmentsUploaded;
  @JsonKey(name: 'chatroom_id')
  final int? chatroomId;
  @JsonKey(name: 'community_id')
  final int? communityId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'created_epoch')
  final int? createdEpoch;
  final String? date;
  @JsonKey(name: 'deleted_by_user_id')
  final int? deletedByUserId;
  @JsonKey(name: 'device_id')
  final String? deviceId;
  @JsonKey(name: 'end_time')
  final int? endTime;
  @JsonKey(name: 'expiry_time')
  final int? expiryTime;
  @JsonKey(name: 'has_files')
  final bool? hasFiles;
  @JsonKey(name: 'has_reactions')
  final bool? hasReactions;
  final String? header;
  final int id;
  @JsonKey(name: 'internal_link')
  final String? internalLink;
  @JsonKey(name: 'is_anonymous')
  final bool? isAnonymous;
  @JsonKey(name: 'is_edited')
  final bool? isEdited;
  @JsonKey(name: 'last_updated')
  final int? lastUpdated;
  final String? location;
  @JsonKey(name: 'location_lat')
  final String? locationLat;
  @JsonKey(name: 'location_long')
  final String? locationLong;
  @JsonKey(name: 'multiple_select_no')
  final int? multipleSelectNo;
  @JsonKey(name: 'multiple_select_state')
  final int? multipleSelectState;
  @JsonKey(name: 'og_tags')
  final OgTagsEntity? ogTags;
  @JsonKey(name: 'online_link_enable_before')
  final int? onlineLinkEnableBefore;
  @JsonKey(name: 'poll_answer_text')
  final String? pollAnswerText;
  @JsonKey(name: 'poll_type')
  final int? pollType;
  @JsonKey(name: 'reply_chatroom_id')
  final int? replyChatroomId;
  @JsonKey(name: 'reply_id')
  final int? replyId;
  @JsonKey(name: 'reply_conversation')
  final int? replyConversation;
  @JsonKey(name: 'reply_conversation_object')
  final ConversationEntity? replyConversationObject;
  @JsonKey(name: 'start_time')
  final int? startTime;
  final int? state;
  @JsonKey(name: 'temporary_id')
  final String? temporaryId;
  @JsonKey(name: 'member_id')
  final int? memberId;
  @JsonKey(name: 'to_show_results')
  final bool? toShowResults;
  @JsonKey(name: 'poll_type_text')
  final String? pollTypeText;
  @JsonKey(name: 'submit_type_text')
  final String? submitTypeText;
  final UserEntity? member;
  final List<ReactionEntity>? conversationReactionsEntity;
  final List<PollOptionEntity>? polls;
  @JsonKey(name: 'no_poll_expiry')
  final bool? noPollExpiry;
  @JsonKey(name: 'allow_vote_change')
  final bool? allowVoteChange;

  ConversationEntity({
    this.allowAddOption,
    required this.answer,
    this.apiVersion,
    this.attachmentCount,
    this.attachmentsUploaded,
    this.chatroomId,
    this.attachments,
    this.communityId,
    required this.createdAt,
    this.createdEpoch,
    this.date,
    this.deletedByUserId,
    this.deviceId,
    this.endTime,
    this.expiryTime,
    this.hasFiles,
    this.hasReactions,
    required this.header,
    required this.id,
    this.internalLink,
    this.isAnonymous,
    this.isEdited,
    this.lastUpdated,
    this.location,
    this.locationLat,
    this.locationLong,
    this.multipleSelectNo,
    this.multipleSelectState,
    this.ogTags,
    this.onlineLinkEnableBefore,
    this.pollAnswerText,
    this.pollType,
    this.replyChatroomId,
    this.replyId,
    this.replyConversation,
    this.replyConversationObject,
    this.startTime,
    this.state,
    this.temporaryId,
    this.memberId,
    this.toShowResults,
    this.pollTypeText,
    this.submitTypeText,
    this.member,
    this.conversationReactionsEntity,
    this.polls,
    this.noPollExpiry,
    this.allowVoteChange,
  });

  factory ConversationEntity.fromJson(Map<String, dynamic> json) =>
      _$ConversationEntityFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$ConversationEntityToJson(this);
}
