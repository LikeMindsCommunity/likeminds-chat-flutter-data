import 'package:json_annotation/json_annotation.dart';

part 'check_dm_status_response_model.g.dart';

class CheckDMStatusResponse {
  final bool success;
  final String? errorMessage;
  final String? cta;
  final bool? showDm;

  CheckDMStatusResponse({
    required this.success,
    this.errorMessage,
    this.cta,
    this.showDm,
  });

  factory CheckDMStatusResponse.fromEntity(CheckDMStatusResponseEntity entity) {
    return CheckDMStatusResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      cta: entity.cta,
      showDm: entity.showDm,
    );
  }

  CheckDMStatusResponseEntity toEntity() {
    return CheckDMStatusResponseEntity(
      success: success,
      errorMessage: errorMessage,
      cta: cta,
      showDm: showDm,
    );
  }
}

@JsonSerializable()
class CheckDMStatusResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final String? cta;
  @JsonKey(name: "show_dm")
  final bool? showDm;

  CheckDMStatusResponseEntity({
    required this.success,
    this.errorMessage,
    this.cta,
    this.showDm,
  });

  factory CheckDMStatusResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckDMStatusResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDMStatusResponseEntityToJson(this);
}
