import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
part 'validate_user_response_model.g.dart';

class ValidateUserResponse {
  final User? user;
  final Community? community;
  final bool? appAccess;

  ValidateUserResponse({
    this.user,
    this.community,
    this.appAccess,
  });

  factory ValidateUserResponse.fromEntity(ValidateUserResponseEntity entity) {
    return ValidateUserResponse(
      user: entity.user != null ? User.fromEntity(entity.user!) : null,
      community: entity.community != null
          ? Community.fromEntity(entity.community!)
          : null,
      appAccess: entity.appAccess,
    );
  }

  ValidateUserResponseEntity toEntity() {
    return ValidateUserResponseEntity(
      user: user?.toEntity(),
      community: community?.toEntity(),
      appAccess: appAccess,
    );
  }
}

@JsonSerializable()
class ValidateUserResponseEntity {
  @JsonKey(name: 'user')
  final UserEntity? user;

  @JsonKey(name: 'community')
  final CommunityEntity? community;

  @JsonKey(name: 'app_access')
  final bool? appAccess;

  ValidateUserResponseEntity({
    this.user,
    this.community,
    this.appAccess,
  });

  factory ValidateUserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ValidateUserResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateUserResponseEntityToJson(this);
}
