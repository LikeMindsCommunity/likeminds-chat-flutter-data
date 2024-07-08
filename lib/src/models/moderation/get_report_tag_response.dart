import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/moderation/report_tag.dart';
part 'get_report_tag_response.g.dart';

class GetReportTagResponse {
  final List<ReportTag>? reportTags;

  GetReportTagResponse({
    this.reportTags,
  });

  factory GetReportTagResponse.fromEntity(GetReportTagResponseEntity entity) {
    return GetReportTagResponse(
      reportTags:
          entity.reportTags?.map((e) => ReportTag.fromEntity(e)).toList(),
    );
  }

  GetReportTagResponseEntity toEntity() {
    return GetReportTagResponseEntity(
      reportTags:
          reportTags?.map<ReportTagEntity>((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetReportTagResponseEntity {
  @JsonKey(name: 'report_tags')
  final List<ReportTagEntity>? reportTags;

  GetReportTagResponseEntity({
    this.reportTags,
  });

  factory GetReportTagResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetReportTagResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportTagResponseEntityToJson(this);
}
