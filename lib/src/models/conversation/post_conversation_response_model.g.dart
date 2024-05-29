// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostConversationResponseEntity _$PostConversationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    PostConversationResponseEntity(
      conversation: json['conversation'] == null
          ? null
          : ConversationEntity.fromJson(
              json['conversation'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostConversationResponseEntityToJson(
        PostConversationResponseEntity instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
      'id': instance.id,
    };
