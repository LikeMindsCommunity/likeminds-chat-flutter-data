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
      clicked: json['clicked'] as bool?,
      isCm: json['is_cm'] as bool?,
      messaged: json['messaged'] as bool?,
    );

Map<String, dynamic> _$CheckDMTabResponseEntityToJson(
        CheckDMTabResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'clicked': instance.clicked,
      'is_cm': instance.isCm,
      'messaged': instance.messaged,
    };
