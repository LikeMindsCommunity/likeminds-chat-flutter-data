// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationSearchResponseEntity _$ConversationSearchResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ConversationSearchResponseEntity(
      conversations: (json['conversations'] as List<dynamic>?)
          ?.map((e) => ConversationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      widgets: (json['widgets'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, LMWidgetDataEntity.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ConversationSearchResponseEntityToJson(
        ConversationSearchResponseEntity instance) =>
    <String, dynamic>{
      'conversations': instance.conversations,
      'widgets': instance.widgets,
    };
