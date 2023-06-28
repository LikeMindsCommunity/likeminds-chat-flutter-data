// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationEntity _$ConversationEntityFromJson(Map<String, dynamic> json) =>
    ConversationEntity(
      allowAddOption: json['allow_add_option'] as bool?,
      answer: json['answer'] as String,
      apiVersion: json['api_version'] as int?,
      attachmentCount: json['attachment_count'] as int?,
      attachmentsUploaded: json['attachments_uploaded'] as bool?,
      chatroomId: json['chatroom_id'] as int?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      communityId: json['community_id'] as int?,
      createdAt: json['created_at'].toString(),
      createdEpoch: json['created_epoch'] as int?,
      date: json['date'] as String?,
      deletedByUserId: json['deleted_by_user_id'] as int?,
      deviceId: json['device_id'] as String?,
      endTime: json['end_time'] as int?,
      expiryTime: json['expiry_time'] as int?,
      hasFiles: json['has_files'] as bool?,
      hasReactions: json['has_reactions'] as bool?,
      header: json['header'] as String?,
      id: json['id'] as int,
      internalLink: json['internal_link'] as String?,
      isAnonymous: json['is_anonymous'] as bool?,
      isEdited: json['is_edited'] as bool?,
      lastUpdated: json['last_updated'] as int?,
      location: json['location'] as String?,
      locationLat: json['location_lat'] as String?,
      locationLong: json['location_long'] as String?,
      multipleSelectNo: json['multiple_select_no'] as int?,
      multipleSelectState: json['multiple_select_state'] as int?,
      ogTags: json['og_tags'],
      onlineLinkEnableBefore: json['online_link_enable_before'] as int?,
      pollAnswerText: json['poll_answer_text'] as String?,
      pollType: json['poll_type'] as int?,
      replyChatroomId: json['reply_chatroom_id'] as int?,
      replyId: (json['reply_id'] ?? json['reply_conversation']) as int?,
      replyConversation: json['reply_conversation'] as int?,
      replyConversationObject: json['reply_conversation_object'] == null
          ? null
          : ConversationEntity.fromJson(
              json['reply_conversation_object'] as Map<String, dynamic>),
      startTime: json['start_time'] as int?,
      state: json['state'] as int?,
      temporaryId: json['temporary_id'] as String?,
      userId: (json['user_id'] ?? json['member_id']) as int?,
      memberId: json['member_id'] as int?,
      toShowResults: json['to_show_results'] as bool?,
      pollTypeText: json['poll_type_text'] as String?,
      submitTypeText: json['submit_type_text'] as String?,
      member: json['member'] == null
          ? null
          : UserEntity.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationEntityToJson(ConversationEntity instance) =>
    <String, dynamic>{
      'allow_add_option': instance.allowAddOption,
      'answer': instance.answer,
      'api_version': instance.apiVersion,
      'attachment_count': instance.attachmentCount,
      'attachments': instance.attachments,
      'attachments_uploaded': instance.attachmentsUploaded,
      'chatroom_id': instance.chatroomId,
      'community_id': instance.communityId,
      'created_at': instance.createdAt,
      'created_epoch': instance.createdEpoch,
      'date': instance.date,
      'deleted_by_user_id': instance.deletedByUserId,
      'device_id': instance.deviceId,
      'end_time': instance.endTime,
      'expiry_time': instance.expiryTime,
      'has_files': instance.hasFiles,
      'has_reactions': instance.hasReactions,
      'header': instance.header,
      'id': instance.id,
      'internal_link': instance.internalLink,
      'is_anonymous': instance.isAnonymous,
      'is_edited': instance.isEdited,
      'last_updated': instance.lastUpdated,
      'location': instance.location,
      'location_lat': instance.locationLat,
      'location_long': instance.locationLong,
      'multiple_select_no': instance.multipleSelectNo,
      'multiple_select_state': instance.multipleSelectState,
      'og_tags': instance.ogTags,
      'online_link_enable_before': instance.onlineLinkEnableBefore,
      'poll_answer_text': instance.pollAnswerText,
      'poll_type': instance.pollType,
      'reply_chatroom_id': instance.replyChatroomId,
      'reply_id': instance.replyId,
      'start_time': instance.startTime,
      'state': instance.state,
      'temporary_id': instance.temporaryId,
      'user_id': instance.userId,
      'member_id': instance.memberId,
      'to_show_results': instance.toShowResults,
      'poll_type_text': instance.pollTypeText,
      'submit_type_text': instance.submitTypeText,
      'member': instance.member,
    };
