// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dm_search_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DMSearchMemberEntity _$DMSearchMemberEntityFromJson(
        Map<String, dynamic> json) =>
    DMSearchMemberEntity(
      clientUserUniqueId: json['client_user_unique_id'] as String?,
      customClickText: json['custom_click_text'] as String?,
      customIntroText: json['custom_intro_text'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isOwner: json['is_owner'] as bool?,
      memberCohorts: (json['member_cohorts'] as List<dynamic>?)
          ?.map((e) => MemberCohortEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      menu: (json['menu'] as List<dynamic>?)
          ?.map((e) => MenuEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      sdkClientInfo: json['sdk_client_info'] == null
          ? null
          : SDKClientInfo.fromJson(
              json['sdk_client_info'] as Map<String, dynamic>),
      state: (json['state'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      userUniqueId: json['user_unique_id'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$DMSearchMemberEntityToJson(
        DMSearchMemberEntity instance) =>
    <String, dynamic>{
      'client_user_unique_id': instance.clientUserUniqueId,
      'custom_click_text': instance.customClickText,
      'custom_intro_text': instance.customIntroText,
      'id': instance.id,
      'is_owner': instance.isOwner,
      'member_cohorts': instance.memberCohorts,
      'menu': instance.menu,
      'name': instance.name,
      'sdk_client_info': instance.sdkClientInfo,
      'state': instance.state,
      'updated_at': instance.updatedAt,
      'user_unique_id': instance.userUniqueId,
      'uuid': instance.uuid,
    };

MenuEntity _$MenuEntityFromJson(Map<String, dynamic> json) => MenuEntity(
      route: json['route'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$MenuEntityToJson(MenuEntity instance) =>
    <String, dynamic>{
      'route': instance.route,
      'title': instance.title,
    };

MemberCohortEntity _$MemberCohortEntityFromJson(Map<String, dynamic> json) =>
    MemberCohortEntity(
      cohortId: (json['cohort_id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MemberCohortEntityToJson(MemberCohortEntity instance) =>
    <String, dynamic>{
      'cohort_id': instance.cohortId,
      'name': instance.name,
    };
