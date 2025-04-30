import 'package:json_annotation/json_annotation.dart';

class CommunitySettings {
  final bool enabled;
  final int? enabledBy;
  final String settingSubTitle;
  final String settingTitle;
  final String settingType;

  CommunitySettings({
    required this.enabled,
    required this.enabledBy,
    required this.settingSubTitle,
    required this.settingTitle,
    required this.settingType,
  });

  factory CommunitySettings.fromEntity(CommunitySettingsEntity entity) {
    return CommunitySettings(
      enabled: entity.enabled,
      enabledBy: entity.enabledBy,
      settingSubTitle: entity.settingSubTitle,
      settingTitle: entity.settingTitle,
      settingType: entity.settingType,
    );
  }

  CommunitySettingsEntity toEntity() {
    return CommunitySettingsEntity(
      enabled: enabled,
      enabledBy: enabledBy,
      settingSubTitle: settingSubTitle,
      settingTitle: settingTitle,
      settingType: settingType,
    );
  }
}

@JsonSerializable()
class CommunitySettingsEntity {
  final bool enabled;

  @JsonKey(name: 'enabled_by')
  final int? enabledBy;

  @JsonKey(name: 'setting_sub_title')
  final String settingSubTitle;

  @JsonKey(name: 'setting_title')
  final String settingTitle;

  @JsonKey(name: 'setting_type')
  final String settingType;

  CommunitySettingsEntity({
    required this.enabled,
    required this.enabledBy,
    required this.settingSubTitle,
    required this.settingTitle,
    required this.settingType,
  });

  factory CommunitySettingsEntity.fromJson(Map<String, dynamic> json) =>
      CommunitySettingsEntity(
        enabled: json['enabled'] as bool,
        enabledBy: json['enabled_by'] ,
        settingSubTitle: json['setting_sub_title'] as String,
        settingTitle: json['setting_title'] as String,
        settingType: json['setting_type'] as String,
      );

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'enabled_by': enabledBy,
        'setting_sub_title': settingSubTitle,
        'setting_title': settingTitle,
        'setting_type': settingType,
      };
}
