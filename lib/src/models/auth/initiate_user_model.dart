import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'initiate_user_model.g.dart';

class InitiateUser {
  final User user;
  final Community community;

  InitiateUser({
    required this.user,
    required this.community,
  });

  /// Converts [InitiateUserEntity] to [InitiateUser] object
  factory InitiateUser.fromEntity(InitiateUserEntity entity) {
    return InitiateUser(
      user: User.fromEntity(entity.user),
      community: Community.fromEntity(entity.community),
    );
  }

  /// Converts [InitiateUser] to [InitiateUserEntity] object
  toEntity() {
    return InitiateUserEntity(
      user: user.toEntity(),
      community: community.toEntity(),
    );
  }
}

@JsonSerializable()
class InitiateUserEntity {
  final UserEntity user;
  final CommunityEntity community;

  InitiateUserEntity({
    required this.user,
    required this.community,
  });

  /// Converts a [Map<String, dynamic>] to [InitiateUserEntity] object
  factory InitiateUserEntity.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserEntityFromJson(json);

  /// Converts [InitiateUserEntity] to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$InitiateUserEntityToJson(this);
}
