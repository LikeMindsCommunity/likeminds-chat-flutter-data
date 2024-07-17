// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditConversationResponseEntity _$EditConversationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    EditConversationResponseEntity(
      conversation: json['conversation'] == null
          ? null
          : ConversationEntity.fromJson(
              json['conversation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditConversationResponseEntityToJson(
        EditConversationResponseEntity instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
    };
