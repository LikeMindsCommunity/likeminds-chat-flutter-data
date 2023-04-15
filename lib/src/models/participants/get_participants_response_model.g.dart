// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_participants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetParticipantsResponseEntity _$GetParticipantsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetParticipantsResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$GetParticipantsResponseEntityToJson(
        GetParticipantsResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'data': instance.data,
    };
