// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decode_url_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DecodeUrlResponseEntity _$DecodeUrlResponseEntityFromJson(
        Map<String, dynamic> json) =>
    DecodeUrlResponseEntity(
      ogTags: json['data']['og_tags'] == null
          ? null
          : OgTagsEntity.fromJson(
              json['data']['og_tags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DecodeUrlResponseEntityToJson(
        DecodeUrlResponseEntity instance) =>
    <String, dynamic>{
      'og_tags': instance.ogTags,
    };
