import 'package:json_annotation/json_annotation.dart';

part 'check_dm_status_response_model.g.dart';

class CheckDMStatusResponse {
  final String? cta;
  final bool? showDm;

  CheckDMStatusResponse({
    this.cta,
    this.showDm,
  });

  factory CheckDMStatusResponse.fromEntity(CheckDMStatusResponseEntity entity) {
    return CheckDMStatusResponse(
      cta: entity.cta,
      showDm: entity.showDm,
    );
  }

  CheckDMStatusResponseEntity toEntity() {
    return CheckDMStatusResponseEntity(
      cta: cta,
      showDm: showDm,
    );
  }
}

@JsonSerializable()
class CheckDMStatusResponseEntity {
  final String? cta;
  @JsonKey(name: "show_dm")
  final bool? showDm;

  CheckDMStatusResponseEntity({
    this.cta,
    this.showDm,
  });

  factory CheckDMStatusResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckDMStatusResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDMStatusResponseEntityToJson(this);
}
