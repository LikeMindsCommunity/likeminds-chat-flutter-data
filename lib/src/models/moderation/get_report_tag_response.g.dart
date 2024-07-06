// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_report_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportTagResponseEntity _$GetReportTagResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetReportTagResponseEntity(
      reportTags: (json['report_tags'] as List<dynamic>?)
          ?.map((e) => ReportTagEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetReportTagResponseEntityToJson(
        GetReportTagResponseEntity instance) =>
    <String, dynamic>{
      'report_tags': instance.reportTags,
    };
