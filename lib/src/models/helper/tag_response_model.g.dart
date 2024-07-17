// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagResponseModelEntity _$TagResponseModelEntityFromJson(
        Map<String, dynamic> json) =>
    TagResponseModelEntity(
      groupTags: (json['group_tags'] as List<dynamic>?)
          ?.map((e) => GroupTagEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['community_members'] as List<dynamic>?)
          ?.map((e) => UserTagEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      participants: (json['chatroom_participants'] as List<dynamic>?)
          ?.map((e) => UserTagEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TagResponseModelEntityToJson(
        TagResponseModelEntity instance) =>
    <String, dynamic>{
      'group_tags': instance.groupTags,
      'community_members': instance.members,
      'chatroom_participants': instance.participants,
    };
