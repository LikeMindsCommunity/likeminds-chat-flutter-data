// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleConversationResponseEntity
    _$GetSingleConversationResponseEntityFromJson(Map<String, dynamic> json) =>
        GetSingleConversationResponseEntity(
          success: json['success'] as bool,
          errorMessage: json['error_message'] as String?,
          conversation: json['data']['conversations'] == null
              ? null
              : ConversationEntity.fromJson(
                  (json['data']['conversations'] as List).first
                      as Map<String, dynamic>),
        );

Map<String, dynamic> _$GetSingleConversationResponseEntityToJson(
        GetSingleConversationResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'conversation': instance.conversation,
    };
