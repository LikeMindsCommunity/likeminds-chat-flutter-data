import 'package:json_annotation/json_annotation.dart';

import 'package:likeminds_chat_fl/src/models/sdk/sdk_client_info_model.dart';
part 'dm_search_member_model.g.dart';

class DMSearchMember {
  final String? clientUserUniqueId;
  final String? customClickText;
  final String? customIntroText;
  final int? id;
  final bool? isOwner;
  final List<MemberCohort>? memberCohorts;
  final List<Menu>? menu;
  final String? name;
  final SDKClientInfo? sdkClientInfo;
  final int? state;
  final int? updatedAt;
  final String? userUniqueId;
  final String? uuid;

  DMSearchMember({
    this.clientUserUniqueId,
    this.customClickText,
    this.customIntroText,
    this.id,
    this.isOwner,
    this.memberCohorts,
    this.menu,
    this.name,
    this.sdkClientInfo,
    this.state,
    this.updatedAt,
    this.userUniqueId,
    this.uuid,
  });

  factory DMSearchMember.fromEntity(DMSearchMemberEntity entity) {
    return DMSearchMember(
      clientUserUniqueId: entity.clientUserUniqueId,
      customClickText: entity.customClickText,
      customIntroText: entity.customIntroText,
      id: entity.id,
      isOwner: entity.isOwner,
      memberCohorts:
          entity.memberCohorts?.map((e) => MemberCohort.fromEntity(e)).toList(),
      menu: entity.menu?.map((e) => Menu.fromEntity(e)).toList(),
      name: entity.name,
      sdkClientInfo: entity.sdkClientInfo,
      updatedAt: entity.updatedAt,
      userUniqueId: entity.userUniqueId,
      uuid: entity.uuid,
    );
  }

  DMSearchMemberEntity toEntity() {
    return DMSearchMemberEntity(
        clientUserUniqueId: clientUserUniqueId,
        customClickText: customClickText,
        customIntroText: customIntroText,
        id: id,
        isOwner: isOwner,
        memberCohorts: memberCohorts?.map((e) => e.toEntity()).toList(),
        menu: menu?.map((e) => e.toEntity()).toList(),
        name: name,
        sdkClientInfo: sdkClientInfo,
        updatedAt: updatedAt,
        userUniqueId: userUniqueId,
        uuid: uuid);
  }
}

class MemberCohort {
  final int? cohortId;
  final String? name;

  MemberCohort({
    this.cohortId,
    this.name,
  });

  factory MemberCohort.fromEntity(MemberCohortEntity entity) {
    return MemberCohort(cohortId: entity.cohortId, name: entity.name);
  }

  MemberCohortEntity toEntity() {
    return MemberCohortEntity(
      cohortId: cohortId,
      name: name,
    );
  }
}

class Menu {
  final String? route;
  final String? title;

  Menu({
    this.route,
    this.title,
  });

  factory Menu.fromEntity(MenuEntity entity) {
    return Menu(
      route: entity.route,
      title: entity.title,
    );
  }

  MenuEntity toEntity() {
    return MenuEntity(
      route: route,
      title: title,
    );
  }
}

@JsonSerializable()
class DMSearchMemberEntity {
  @JsonKey(name: "client_user_unique_id")
  final String? clientUserUniqueId;
  @JsonKey(name: "custom_click_text")
  final String? customClickText;
  @JsonKey(name: "custom_intro_text")
  final String? customIntroText;
  final int? id;
  @JsonKey(name: "is_owner")
  final bool? isOwner;
  @JsonKey(name: "member_cohorts")
  final List<MemberCohortEntity>? memberCohorts;
  final List<MenuEntity>? menu;
  final String? name;
  @JsonKey(name: "sdk_client_info")
  final SDKClientInfo? sdkClientInfo;
  final int? state;
  @JsonKey(name: "updated_at")
  final int? updatedAt;
  @JsonKey(name: "user_unique_id")
  final String? userUniqueId;
  final String? uuid;

  DMSearchMemberEntity({
    this.clientUserUniqueId,
    this.customClickText,
    this.customIntroText,
    this.id,
    this.isOwner,
    this.memberCohorts,
    this.menu,
    this.name,
    this.sdkClientInfo,
    this.state,
    this.updatedAt,
    this.userUniqueId,
    this.uuid,
  });

  factory DMSearchMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$DMSearchMemberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DMSearchMemberEntityToJson(this);
}

@JsonSerializable()
class MenuEntity {
  String? route;
  String? title;

  MenuEntity({
    this.route,
    this.title,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) =>
      _$MenuEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MenuEntityToJson(this);
}

@JsonSerializable()
class MemberCohortEntity {
  @JsonKey(name: "cohort_id")
  final int? cohortId;
  final String? name;

  MemberCohortEntity({
    this.cohortId,
    this.name,
  });

  factory MemberCohortEntity.fromJson(Map<String, dynamic> json) =>
      _$MemberCohortEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MemberCohortEntityToJson(this);
}
