// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_dm_limit_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckDMLimitResponseEntity _$CheckDMLimitResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CheckDMLimitResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      chatroomId: json['data']['chatroom_id'] as int?,
      isRequestDmLimitExceeded: json['data']['is_request_dm_limit_exceeded'] as bool?,
      newRequestDmTimestamp: json['data']['new_request_dm_timestamp'] as int?,
    );

Map<String, dynamic> _$CheckDMLimitResponseEntityToJson(
        CheckDMLimitResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'chatroom_id': instance.chatroomId,
      'is_request_dm_limit_exceeded': instance.isRequestDmLimitExceeded,
      'new_request_dm_timestamp': instance.newRequestDmTimestamp,
    };
