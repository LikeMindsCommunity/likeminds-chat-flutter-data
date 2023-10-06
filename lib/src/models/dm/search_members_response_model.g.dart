// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_members_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMembersResponseEntity _$SearchMembersResponseEntityFromJson(
        Map<String, dynamic> json) =>
    SearchMembersResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      members: (json['data']['members'] as List<dynamic>?)
          ?.map((e) => DmMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchMembersResponseEntityToJson(
        SearchMembersResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'members': instance.members,
    };
