// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_member_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockMemberResponseEntity _$BlockMemberResponseEntityFromJson(
        Map<String, dynamic> json) =>
    BlockMemberResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      conversationEntity: json['data']['conversation'] == null
          ? null
          : ConversationEntity.fromJson(
              json['data']['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlockMemberResponseEntityToJson(
        BlockMemberResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'conversation': instance.conversationEntity,
    };
