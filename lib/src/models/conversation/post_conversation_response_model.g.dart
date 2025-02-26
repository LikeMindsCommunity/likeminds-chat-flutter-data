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
      widgets: (json['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, LMWidgetDataEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PostConversationResponseEntityToJson(
        PostConversationResponseEntity instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
      'id': instance.id,
      'widgets': instance.widgets,
    };
