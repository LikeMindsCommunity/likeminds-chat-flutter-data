// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_members_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMembersResponseEntity _$SearchMembersResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SearchMembersResponseEntity(
      members: (json['data']['members'] as List<dynamic>?)
          ?.map((e) => DMSearchMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchMembersResponseEntityToJson(
        SearchMembersResponseEntity instance) =>
    <String, dynamic>{
      'members': instance.members,
    };
