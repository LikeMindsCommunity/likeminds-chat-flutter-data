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
      unreadDMCount: json['unread_dm_count'] as bool?,
    );

Map<String, dynamic> _$CheckDMTabResponseEntityToJson(
        CheckDMTabResponseEntity instance) =>
    <String, dynamic>{
      'hideDMTab': instance.hideDMTab,
      'isCm': instance.isCm,
      'unreadDMCount': instance.unreadDMCount,
    };
