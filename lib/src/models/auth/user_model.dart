import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/models/profile/profile_model.dart';
import 'package:likeminds_chat_fl/src/models/sdk/sdk_client_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

enum UserRole {
  chatbot('chatbot'),
  member('member'),
  admin('admin');

  final String value;
  const UserRole(this.value);

  factory UserRole.fromJson(String json) {
    switch (json.toLowerCase()) {
      case 'chatbot':
        return UserRole.chatbot;
      case 'member':
        return UserRole.member;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.member;
    }
  }

  int toIntValue() {
    switch (this) {
      case UserRole.admin:
        return 1;
      case UserRole.chatbot:
        return 0;
      case UserRole.member:
        return 4;
    }
  }
}

class User {
  final int id;
  final String name;
  final String? imageUrl;
  final bool? isGuest;
  final String? userUniqueId;
  final String? organisationName;
  final SDKClientInfo? sdkClientInfo;
  final int? updatedAt;
  final bool? isOwner;
  final String? customTitle;
  final String? memberSince;
  final String? route;
  final int? state;
  final int? communityId;
  final int? createdAt;
  final String? customIntroText;
  final int? memberSinceEpoch;
  final List<UserRole>? roles;
  final Profile? profile;

  User({
    required this.id,
    required this.name,
    this.imageUrl,
    this.isGuest,
    this.userUniqueId,
    this.organisationName,
    this.sdkClientInfo,
    this.updatedAt,
    this.isOwner,
    this.customTitle,
    this.memberSince,
    this.route,
    this.state,
    this.communityId,
    this.createdAt,
    this.memberSinceEpoch,
    this.customIntroText,
    this.roles,
    this.profile,
  });

  factory User.fromEntity(UserEntity entity) {
    return User(
        id: entity.id,
        name: entity.name,
        imageUrl: entity.imageUrl,
        isGuest: entity.isGuest,
        userUniqueId: entity.userUniqueId,
        organisationName: entity.organisationName,
        sdkClientInfo: entity.sdkClientInfo,
        updatedAt: entity.updatedAt,
        isOwner: entity.isOwner,
        customTitle: entity.customTitle,
        memberSince: entity.memberSince,
        route: entity.route,
        state: entity.state,
        communityId: entity.communityId,
        createdAt: entity.createdAt,
        customIntroText: entity.customIntroText,
        memberSinceEpoch: entity.memberSinceEpoch,
        roles: entity.roles,
        profile: entity.profile != null
            ? Profile.fromEntity(entity.profile!)
            : null);
  }

  UserEntity toEntity() {
    return UserEntity(
        id: id,
        name: name,
        imageUrl: imageUrl,
        isGuest: isGuest,
        userUniqueId: userUniqueId,
        organisationName: organisationName,
        sdkClientInfo: sdkClientInfo,
        updatedAt: updatedAt,
        isOwner: isOwner,
        customTitle: customTitle,
        memberSince: memberSince,
        route: route,
        state: state,
        communityId: communityId,
        createdAt: createdAt,
        customIntroText: customIntroText,
        memberSinceEpoch: memberSinceEpoch,
        roles: roles,
        profile: profile?.toEntity());
  }
}

@JsonSerializable()
class UserEntity {
  final int id;
  final String name;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'is_guest')
  final bool? isGuest;

  @JsonKey(name: 'user_unique_id')
  final String? userUniqueId;

  @JsonKey(name: 'organisation_name')
  final String? organisationName;

  @JsonKey(name: 'sdk_client_info')
  final SDKClientInfo? sdkClientInfo;

  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  @JsonKey(name: 'is_owner')
  final bool? isOwner;

  @JsonKey(name: 'custom_title')
  final String? customTitle;

  @JsonKey(name: 'member_since')
  final String? memberSince;

  @JsonKey(name: 'route')
  final String? route;

  @JsonKey(name: 'state')
  final int? state;

  @JsonKey(name: 'community_id')
  final int? communityId;

  @JsonKey(name: 'created_at')
  final int? createdAt;

  @JsonKey(name: 'custom_intro_text')
  final String? customIntroText;

  @JsonKey(name: 'member_since_epoch')
  final int? memberSinceEpoch;

  @JsonKey(name: 'roles')
  final List<UserRole>? roles;
  @JsonKey(name: "profile")
  final ProfileEntity? profile;
  UserEntity(
      {required this.id,
      required this.name,
      this.imageUrl,
      this.isGuest,
      this.userUniqueId,
      this.organisationName,
      this.sdkClientInfo,
      this.updatedAt,
      this.isOwner,
      this.customTitle,
      this.memberSince,
      this.route,
      this.state,
      this.communityId,
      this.createdAt,
      this.customIntroText,
      this.memberSinceEpoch,
      this.roles,
      this.profile});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
