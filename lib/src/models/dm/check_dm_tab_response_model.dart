import 'package:json_annotation/json_annotation.dart';

part 'check_dm_tab_response_model.g.dart';

class CheckDMTabResponse {
  final bool success;
  final String? errorMessage;
  final bool? clicked;
  final bool? isCm;
  final bool? messaged;

  CheckDMTabResponse({
    required this.success,
    this.errorMessage,
    this.clicked,
    this.isCm,
    this.messaged,
  });

  factory CheckDMTabResponse.fromEntity(CheckDMTabResponseEntity entity) {
    return CheckDMTabResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      clicked: entity.clicked,
      isCm: entity.isCm,
      messaged: entity.messaged,
    );
  }

  CheckDMTabResponseEntity toEntity() {
    return CheckDMTabResponseEntity(
      success: success,
      errorMessage: errorMessage,
      clicked: clicked,
      isCm: isCm,
      messaged: messaged,
    );
  }
}

@JsonSerializable()
class CheckDMTabResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final bool? clicked;
  @JsonKey(name: "is_cm")
  final bool? isCm;
  final bool? messaged;

  CheckDMTabResponseEntity({
    required this.success,
    this.errorMessage,
    this.clicked,
    this.isCm,
    this.messaged,
  });

  factory CheckDMTabResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckDMTabResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDMTabResponseEntityToJson(this);
}
