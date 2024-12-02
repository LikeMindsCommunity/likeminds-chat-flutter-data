// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ai_chatbots_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAIChatbotsResponseEntity _$GetAIChatbotsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetAIChatbotsResponseEntity(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      totalChatbots: json['total_chatbots'] as int,
      users: (json['users'] as List<dynamic>)
          .map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAIChatbotsResponseEntityToJson(
        GetAIChatbotsResponseEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_chatbots': instance.totalChatbots,
      'users': instance.users.map((e) => e.toJson()).toList(),
    };
