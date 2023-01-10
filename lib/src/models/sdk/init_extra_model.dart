import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_groupchat/src/models/branding/fonts_model.dart';
import 'package:likeminds_groupchat/src/models/sdk/likeminds_callback_model.dart';

part 'init_extra_model.g.dart';

@JsonSerializable()
class InitiateLikeMindsChatExtra {
  final String application;
  final String apiKey;
  final int? notificationIcon;
  final String? domain;
  final LikeMindsCallback? likeMindsCallback;
  final Fonts? fonts;

  InitiateLikeMindsChatExtra({
    required this.application,
    required this.apiKey,
    this.notificationIcon,
    this.domain,
    this.likeMindsCallback,
    this.fonts,
  });

  factory InitiateLikeMindsChatExtra.fromJson(Map<String, dynamic> json) =>
      _$InitiateLikeMindsChatExtraFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateLikeMindsChatExtraToJson(this);
}
