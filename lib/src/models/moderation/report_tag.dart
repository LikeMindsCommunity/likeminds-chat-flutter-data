import 'package:json_annotation/json_annotation.dart';
part 'report_tag.g.dart';

class ReportTag {
  final int id;
  final String name;

  ReportTag({required this.id, required this.name});

  factory ReportTag.fromEntity(ReportTagEntity entity) {
    return ReportTag(
      id: entity.id,
      name: entity.name,
    );
  }

  ReportTagEntity toEntity() {
    return ReportTagEntity(
      id: id,
      name: name,
    );
  }
}

@JsonSerializable()
class ReportTagEntity {
  final int id;
  final String name;

  ReportTagEntity({required this.id, required this.name});

  factory ReportTagEntity.fromJson(Map<String, dynamic> json) =>
      _$ReportTagEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReportTagEntityToJson(this);
}
