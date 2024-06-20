import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'initiate_user_response_model.g.dart';

class InitiateUserResponse {
  final bool? appAccess;
  final User? user;
  final Community? community;
  final String? accessToken;
  final String? refreshToken;

  InitiateUserResponse({
    this.appAccess,
    this.user,
    this.community,
    this.accessToken,
    this.refreshToken,
  });

  factory InitiateUserResponse.fromEntity(InitiateUserResponseEntity entity) {
    return InitiateUserResponse(
      appAccess: entity.appAccess,
      user: entity.user != null ? User.fromEntity(entity.user!) : null,
      community: entity.community != null
          ? Community.fromEntity(entity.community!)
          : null,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }

  InitiateUserResponseEntity toEntity() {
    return InitiateUserResponseEntity(
      appAccess: appAccess,
      user: user?.toEntity(),
      community: community?.toEntity(),
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}

@JsonSerializable()
class InitiateUserResponseEntity {
  @JsonKey(name: 'app_access')
  final bool? appAccess;

  @JsonKey(name: 'user')
  final UserEntity? user;

  @JsonKey(name: 'community')
  final CommunityEntity? community;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  InitiateUserResponseEntity({
    this.appAccess,
    this.user,
    this.community,
    this.accessToken,
    this.refreshToken,
  });

  factory InitiateUserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateUserResponseEntityToJson(this);
}
