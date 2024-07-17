import 'package:json_annotation/json_annotation.dart';

part 'refresh_response_model.g.dart';

class RefreshResponse {
  final String? accessToken;
  final String? refreshToken;

  RefreshResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshResponse.fromEntity({required RefreshResponseEntity entity}) =>
      RefreshResponse(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

  RefreshResponseEntity toEntity() => RefreshResponseEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}

@JsonSerializable()
class RefreshResponseEntity {
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  RefreshResponseEntity({
    this.accessToken,
    this.refreshToken,
  });

  factory RefreshResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshResponseEntityToJson(this);
}
