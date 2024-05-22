// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_members_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMembersResponseEntity _$GetAllMembersResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetAllMembersResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      members: (json['data']['members'] as List<dynamic>?)
          ?.map((e) => DmAllMemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllMembersResponseEntityToJson(
        GetAllMembersResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'members': instance.members,
    };
