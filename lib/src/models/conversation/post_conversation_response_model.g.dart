// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostConversationResponseEntity _$PostConversationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    PostConversationResponseEntity(
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
      'conversation': instance.conversation,
      'id': instance.id,
    };
