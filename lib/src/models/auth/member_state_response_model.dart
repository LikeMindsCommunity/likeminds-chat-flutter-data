import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
part 'member_state_response_model.g.dart';

class MemberStateResponse {
  final String? createdAt;
  final bool? editRequired;
  final User? member;
  final List<MemberRight>? memberRights;
  final int? state;

  MemberStateResponse({
    this.createdAt,
    this.editRequired,
    this.member,
    this.memberRights,
    this.state,
  });

  factory MemberStateResponse.fromEntity(MemberStateResponseEntity entity) {
    return MemberStateResponse(
      createdAt: entity.createdAt,
      editRequired: entity.editRequired,
      member: entity.member != null ? User.fromEntity(entity.member!) : null,
      memberRights: entity.memberRights,
      state: entity.state,
    );
  }

  toEntity() {
    return MemberStateResponseEntity(
      createdAt: createdAt,
      editRequired: editRequired,
      member: member?.toEntity(),
      memberRights: memberRights,
      state: state,
    );
  }

  factory MemberStateResponse.fromJson(Map<String, dynamic> json) {
    return MemberStateResponse(
      createdAt: json['created_at'],
      editRequired: json['edit_required'],
      member: json['member'] != null
          ? User.fromEntity(
              UserEntity.fromJson(json['member'] as Map<String, dynamic>),
            )
          : null,
      memberRights: json['member_rights'] != null
          ? (json['member_rights'] as List)
              .map((e) => MemberRight.fromJson(e))
              .toList()
          : null,
      state: json['state'],
    );
  }
}

@JsonSerializable()
class MemberStateResponseEntity {
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'edit_required')
  final bool? editRequired;
  final UserEntity? member;
  @JsonKey(name: 'member_rights')
  final List<MemberRight>? memberRights;
  final int? state;

  MemberStateResponseEntity({
    this.createdAt,
    this.editRequired,
    this.member,
    this.memberRights,
    this.state,
  });

  factory MemberStateResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$MemberStateResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MemberStateResponseEntityToJson(this);
}
