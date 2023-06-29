// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_dm_tab_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckDMTabResponseEntity _$CheckDMTabResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CheckDMTabResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      isCm: json['data']['is_cm'] as bool?,
      hideDMTab: json['data']['hide_dm_tab'] as bool?,
      unreadDMCount: json['data']['unread_dm_count'] as bool?,
    );

Map<String, dynamic> _$CheckDMTabResponseEntityToJson(
        CheckDMTabResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'is_cm': instance.isCm,
      'hide_dm_tab': instance.hideDMTab,
      'unread_dm_count': instance.unreadDMCount,
    };
