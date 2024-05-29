// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_conversation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteConversationResponseEntity _$DeleteConversationResponseEntityFromJson(
        Map<String, dynamic> json) =>
    DeleteConversationResponseEntity(
      conversations: (json['data']['conversations'] as List<dynamic>?)
          ?.map((e) => ConversationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeleteConversationResponseEntityToJson(
        DeleteConversationResponseEntity instance) =>
    <String, dynamic>{
      'conversations': instance.conversations,
    };
