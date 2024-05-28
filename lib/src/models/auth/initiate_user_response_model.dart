import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

part 'initiate_user_response_model.g.dart';

class InitiateUserResponse {
  final bool? appAccess;
  final InitiateUser? initiateUser;
  final LogoutResponse? logoutResponse;
  final String? accessToken;
  final String? refreshToken;

  InitiateUserResponse({
    this.appAccess,
    this.initiateUser,
    this.logoutResponse,
    this.accessToken,
    this.refreshToken,
  });

  factory InitiateUserResponse.fromEntity(InitiateUserResponseEntity entity) {
    return InitiateUserResponse(
      appAccess: entity.appAccess,
      initiateUser: entity.initiateUser != null
          ? InitiateUser.fromEntity(entity.initiateUser!)
          : null,
      logoutResponse: entity.logoutResponse != null
          ? LogoutResponse.fromEntity(entity.logoutResponse!)
          : null,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }

  toEntity() {
    return InitiateUserResponseEntity(
      appAccess: appAccess,
      initiateUser: initiateUser?.toEntity(),
      logoutResponse: logoutResponse?.toEntity(),
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}

@JsonSerializable()
class InitiateUserResponseEntity {
  @JsonKey(name: 'app_access')
  final bool? appAccess;

  @JsonKey(name: 'initiate_user')
  final InitiateUserEntity? initiateUser;

  @JsonKey(name: 'logout_response')
  final LogoutResponseEntity? logoutResponse;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  InitiateUserResponseEntity({
    this.appAccess,
    this.initiateUser,
    this.logoutResponse,
    this.accessToken,
    this.refreshToken,
  });

  factory InitiateUserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateUserResponseEntityToJson(this);

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      "InitiateUserResponse: { appAccess: $appAccess, initiateUser: $initiateUser, logoutResponse: $logoutResponse, accessToken: $accessToken, refreshToken: $refreshToken}";
}
