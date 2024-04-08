// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_dm_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendDMResponseEntity _$SendDMResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SendDMResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      conversationEntity: json['data']['conversation'] == null
          ? null
          : ConversationEntity.fromJson(
              json['data']['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendDMResponseEntityToJson(
        SendDMResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'conversation': instance.conversationEntity,
    };
