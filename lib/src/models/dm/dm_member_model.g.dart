// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dm_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DmMemberEntity _$DmMemberEntityFromJson(Map<String, dynamic> json) =>
    DmMemberEntity(
      customClickText: json['custom_click_text'] as String?,
      customIntroText: json['custom_intro_text'] as String?,
      id: json['id'] as int,
      imageUrl: json['image_url'] as String?,
      isOwner: json['is_owner'] as bool?,
      memberCohorts: (json['member_cohorts'] as List<dynamic>?)
          ?.map((e) => MemberCohortEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      state: json['state'] as int,
      updatedAt: json['updated_at'] as int?,
    );

Map<String, dynamic> _$DmMemberEntityToJson(DmMemberEntity instance) =>
    <String, dynamic>{
      'custom_click_text': instance.customClickText,
      'custom_intro_text': instance.customIntroText,
      'id': instance.id,
      'image_url': instance.imageUrl,
      'is_owner': instance.isOwner,
      'member_cohorts': instance.memberCohorts,
      'name': instance.name,
      'state': instance.state,
      'updated_at': instance.updatedAt,
    };

MemberCohortEntity _$MemberCohortEntityFromJson(Map<String, dynamic> json) =>
    MemberCohortEntity(
      cohortId: json['cohort_id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MemberCohortEntityToJson(MemberCohortEntity instance) =>
    <String, dynamic>{
      'cohort_id': instance.cohortId,
      'name': instance.name,
    };
