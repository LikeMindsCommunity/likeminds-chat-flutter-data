// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_media_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutMediaResponseEntity _$PutMediaResponseEntityFromJson(
        Map<String, dynamic> json) =>
    PutMediaResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$PutMediaResponseEntityToJson(
        PutMediaResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': instance.data,
    };
