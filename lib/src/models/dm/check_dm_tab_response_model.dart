import 'package:json_annotation/json_annotation.dart';

part 'check_dm_tab_response_model.g.dart';

class CheckDMTabResponse {
  final bool success;
  final String? errorMessage;
  final bool? hideDMTab;
  final bool? isCm;
  final bool? unreadDMCount;

  CheckDMTabResponse({
    required this.success,
    this.errorMessage,
    this.isCm,
    this.hideDMTab,
    this.unreadDMCount,
  });

  factory CheckDMTabResponse.fromEntity(CheckDMTabResponseEntity entity) {
    return CheckDMTabResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      isCm: entity.isCm,
      hideDMTab: entity.hideDMTab,
      unreadDMCount: entity.unreadDMCount,
    );
  }

  CheckDMTabResponseEntity toEntity() {
    return CheckDMTabResponseEntity(
      success: success,
      errorMessage: errorMessage,
      isCm: isCm,
      hideDMTab: hideDMTab,
      unreadDMCount: unreadDMCount,
    );
  }
}

@JsonSerializable()
class CheckDMTabResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final bool? hideDMTab;
  final bool? isCm;
  final bool? unreadDMCount;

  CheckDMTabResponseEntity({
    required this.success,
    this.errorMessage,
    this.isCm,
    this.hideDMTab,
    this.unreadDMCount,
  });

  factory CheckDMTabResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckDMTabResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDMTabResponseEntityToJson(this);
}
