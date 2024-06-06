// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_dm_tab_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckDMTabResponseEntity _$CheckDMTabResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CheckDMTabResponseEntity(
      isCm: json['is_cm'] as bool?,
      hideDMTab: json['hide_dm_tab'] as bool?,
      unreadDMCount: json['unread_dm_count'] as int?,
    );

Map<String, dynamic> _$CheckDMTabResponseEntityToJson(
        CheckDMTabResponseEntity instance) =>
    <String, dynamic>{
      'hide_dm_tab': instance.hideDMTab,
      'is_cm': instance.isCm,
      'unread_dm_count': instance.unreadDMCount,
    };
