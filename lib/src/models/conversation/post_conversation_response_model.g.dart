// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostConversationResponseEntity _$PostConversationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    PostConversationResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      conversation: json['data']['conversation'] == null
          ? null
          : ConversationEntity.fromJson(
              json['data']['conversation'] as Map<String, dynamic>,
              conversationPollMeta: {
                  "${json['data']['conversation']['id']}":
                      json['data']['conversation']['polls'] ?? []
                }),
      id: json['data']['id'] as int?,
    );

Map<String, dynamic> _$PostConversationResponseEntityToJson(
        PostConversationResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'conversation': instance.conversation,
      'id': instance.id,
    };
