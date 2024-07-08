// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTagEntity _$ReportTagEntityFromJson(Map<String, dynamic> json) =>
    ReportTagEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ReportTagEntityToJson(ReportTagEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
