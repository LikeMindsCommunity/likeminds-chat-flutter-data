// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentEntity _$AttachmentEntityFromJson(Map<String, dynamic> json) =>
    AttachmentEntity(
      answerId: json['answer_id'] as int?,
      createdAt: json['created_at'] as int?,
      dimensions: json['dimensions'],
      fileUrl: json['file_url'] as String?,
      url: json['url'] as String?,
      height: json['height'],
      id: json['id'] as int?,
      index: json['index'] as int?,
      locationLat: json['location_lat'],
      locationLong: json['location_long'],
      locationName: json['location_name'],
      meta: json['meta'],
      name: json['name'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      type: json['type'] as String?,
      width: json['width'],
    );

Map<String, dynamic> _$AttachmentEntityToJson(AttachmentEntity instance) =>
    <String, dynamic>{
      'answer_id': instance.answerId,
      'created_at': instance.createdAt,
      'dimensions': instance.dimensions,
      'file_url': instance.fileUrl,
      'height': instance.height,
      'id': instance.id,
      'index': instance.index,
      'location_lat': instance.locationLat,
      'location_long': instance.locationLong,
      'location_name': instance.locationName,
      'meta': instance.meta,
      'name': instance.name,
      'thumbnail_url': instance.thumbnailUrl,
      'type': instance.type,
      'width': instance.width,
    };
