import 'package:json_annotation/json_annotation.dart';
part 'dm_member_model.g.dart';

class DmMember {
  final String? customClickText;
  final String? customIntroText;
  final int id;
  final String? imageUrl;
  final bool? isOwner;
  final List<MemberCohort>? memberCohorts;
  final String? name;
  final int state;
  final int? updatedAt;

  DmMember({
    this.customClickText,
    this.customIntroText,
    required this.id,
    this.imageUrl,
    this.isOwner,
    this.memberCohorts,
    this.name,
    required this.state,
    this.updatedAt,
  });

  factory DmMember.fromEntity(DmMemberEntity entity) {
    return DmMember(
      customClickText: entity.customClickText,
      customIntroText: entity.customIntroText,
      id: entity.id,
      imageUrl: entity.imageUrl,
      isOwner: entity.isOwner,
      memberCohorts: entity.memberCohorts != null
          ? entity.memberCohorts!
              .map((e) => MemberCohort.fromEntity(e))
              .toList()
          : null,
      name: entity.name,
      state: entity.state,
      updatedAt: entity.updatedAt,
    );
  }

  DmMemberEntity toEntity() {
    return DmMemberEntity(
      customClickText: customClickText,
      customIntroText: customIntroText,
      id: id,
      imageUrl: imageUrl,
      isOwner: isOwner,
      memberCohorts: memberCohorts?.map((e) => e.toEntity()).toList(),
      name: name,
      state: state,
      updatedAt: updatedAt,
    );
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

@JsonSerializable()
class DmMemberEntity {
  @JsonKey(name: "custom_click_text")
  final String? customClickText;
  @JsonKey(name: "custom_intro_text")
  final String? customIntroText;
  final int id;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "is_owner")
  final bool? isOwner;
  @JsonKey(name: "member_cohorts")
  final List<MemberCohortEntity>? memberCohorts;
  final String? name;
  final int state;
  @JsonKey(name: "updated_at")
  final int? updatedAt;

  DmMemberEntity({
    this.customClickText,
    this.customIntroText,
    required this.id,
    this.imageUrl,
    this.isOwner,
    this.memberCohorts,
    this.name,
    required this.state,
    this.updatedAt,
  });

  factory DmMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$DmMemberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DmMemberEntityToJson(this);
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
