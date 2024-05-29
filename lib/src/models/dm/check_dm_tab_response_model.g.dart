// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_dm_tab_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckDMTabResponseEntity _$CheckDMTabResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CheckDMTabResponseEntity(
      isCm: json['data']?['is_cm'] as bool?,
      hideDMTab: json['data']?['hide_dm_tab'] as bool?,
      unreadDMCount: json['data']?['unread_dm_count'] as bool?,
    );

Map<String, dynamic> _$CheckDMTabResponseEntityToJson(
        CheckDMTabResponseEntity instance) =>
    <String, dynamic>{
      'is_cm': instance.isCm,
      'hide_dm_tab': instance.hideDMTab,
      'unread_dm_count': instance.unreadDMCount,
    };
