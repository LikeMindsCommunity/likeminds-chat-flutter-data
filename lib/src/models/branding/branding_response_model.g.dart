// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branding_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandingResponse _$BrandingResponseFromJson(Map<String, dynamic> json) =>
    BrandingResponse(
      success: json['success'] as bool,
      branding: json['branding'] == null
          ? null
          : Branding.fromEntity(BrandingEntity.fromJson(
              json['branding'] as Map<String, dynamic>)),
    );

Map<String, dynamic> _$BrandingResponseToJson(BrandingResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'branding': instance.branding,
      'error_message': instance.errorMessage,
    };
