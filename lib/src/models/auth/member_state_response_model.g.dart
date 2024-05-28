// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_state_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberStateResponseEntity _$MemberStateResponseEntityFromJson(
        Map<String, dynamic> json) =>
    MemberStateResponseEntity(
      createdAt: json['created_at'] as String?,
      editRequired: json['edit_required'] as bool?,
      member: json['member'] == null
          ? null
          : UserEntity.fromJson(json['member'] as Map<String, dynamic>),
      memberRights: (json['member_rights'] as List<dynamic>?)
          ?.map((e) => MemberRight.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['state'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MemberStateResponseEntityToJson(
        MemberStateResponseEntity instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'edit_required': instance.editRequired,
      'member': instance.member,
      'member_rights': instance.memberRights,
      'state': instance.state,
    };
