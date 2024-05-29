// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_dm_status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckDMStatusResponseEntity _$CheckDMStatusResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CheckDMStatusResponseEntity(
      cta: json['data']['cta'] as String?,
      showDm: json['data']['show_dm'] as bool?,
    );

Map<String, dynamic> _$CheckDMStatusResponseEntityToJson(
        CheckDMStatusResponseEntity instance) =>
    <String, dynamic>{
      'cta': instance.cta,
      'show_dm': instance.showDm,
    };
