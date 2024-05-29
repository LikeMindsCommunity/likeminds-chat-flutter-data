import 'package:json_annotation/json_annotation.dart';

part 'check_dm_tab_response_model.g.dart';

class CheckDMTabResponse {
  final bool? hideDMTab;
  final bool? isCm;
  final bool? unreadDMCount;

  CheckDMTabResponse({
    this.isCm,
    this.hideDMTab,
    this.unreadDMCount,
  });

  factory CheckDMTabResponse.fromEntity(CheckDMTabResponseEntity entity) {
    return CheckDMTabResponse(
      isCm: entity.isCm,
      hideDMTab: entity.hideDMTab,
      unreadDMCount: entity.unreadDMCount,
    );
  }

  CheckDMTabResponseEntity toEntity() {
    return CheckDMTabResponseEntity(
      isCm: isCm,
      hideDMTab: hideDMTab,
      unreadDMCount: unreadDMCount,
    );
  }
}

@JsonSerializable()
class CheckDMTabResponseEntity {
  @JsonKey(name: 'hide_dm_tab')
  final bool? hideDMTab;
  @JsonKey(name: 'is_cm')
  final bool? isCm;
  @JsonKey(name: 'unread_dm_count')
  final bool? unreadDMCount;

  CheckDMTabResponseEntity({
    this.isCm,
    this.hideDMTab,
    this.unreadDMCount,
  });

  factory CheckDMTabResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckDMTabResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDMTabResponseEntityToJson(this);
}
