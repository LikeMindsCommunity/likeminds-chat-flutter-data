// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_dm_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendDMResponseEntity _$SendDMResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SendDMResponseEntity(
      conversationEntity: json['data']['conversation'] == null
          ? null
          : ConversationEntity.fromJson(
              json['data']['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendDMResponseEntityToJson(
        SendDMResponseEntity instance) =>
    <String, dynamic>{
      'conversation': instance.conversationEntity,
    };
