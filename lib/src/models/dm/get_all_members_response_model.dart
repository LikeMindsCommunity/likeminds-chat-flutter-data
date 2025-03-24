import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

class GetAllMembersResponse {
  final int? adminsCount;
  final Community? community;
  final List<User>? members;
  final int? membersCount;
  final int? pendingMembersCount;
  final int? totalFilteredMembers;
  final int? totalMembers;
  final Map<String, LMWidgetData>? widgets;

  GetAllMembersResponse({
    this.adminsCount,
    this.community,
    this.members,
    this.membersCount,
    this.pendingMembersCount,
    this.totalFilteredMembers,
    this.totalMembers,
    this.widgets,
  });

  factory GetAllMembersResponse.fromEntity(GetAllMembersResponseEntity entity) {
    return GetAllMembersResponse(
      adminsCount: entity.adminsCount,
      community: Community.fromEntity(entity.community!),
      members: entity.members?.map((e) => User.fromEntity(e)).toList(),
      membersCount: entity.membersCount,
      pendingMembersCount: entity.pendingMembersCount,
      totalFilteredMembers: entity.totalFilteredMembers,
      totalMembers: entity.totalMembers,
      widgets: entity.widgets
          ?.map((key, value) => MapEntry(key, LMWidgetData.fromEntity(value))),
    );
  }

  GetAllMembersResponseEntity toEntity() {
    return GetAllMembersResponseEntity(
      adminsCount: adminsCount,
      community: community?.toEntity(),
      members: members?.map((e) => e.toEntity()).toList(),
      membersCount: membersCount,
      pendingMembersCount: pendingMembersCount,
      totalFilteredMembers: totalFilteredMembers,
      totalMembers: totalMembers,
      widgets: widgets?.map((key, value) => MapEntry(key, value.toEntity())),
    );
  }
}

@JsonSerializable()
class GetAllMembersResponseEntity {
  @JsonKey(name: 'admins_count')
  final int? adminsCount;
  final CommunityEntity? community;
  final List<UserEntity>? members;
  @JsonKey(name: 'members_count')
  final int? membersCount;
  @JsonKey(name: 'pending_members_count')
  final int? pendingMembersCount;
  @JsonKey(name: 'total_filtered_members')
  final int? totalFilteredMembers;
  @JsonKey(name: 'total_members')
  final int? totalMembers;
  final Map<String, LMWidgetDataEntity>? widgets;

  GetAllMembersResponseEntity({
    this.adminsCount,
    this.community,
    this.members,
    this.membersCount,
    this.pendingMembersCount,
    this.totalFilteredMembers,
    this.totalMembers,
    this.widgets,
  });

  factory GetAllMembersResponseEntity.fromJson(Map<String, dynamic> json) =>
      GetAllMembersResponseEntity(
        adminsCount: json['admins_count'],
        community: CommunityEntity.fromJson(json['community']),
        members: (json['members'] as List<dynamic>?)
            ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
        membersCount: json['members_count'],
        pendingMembersCount: json['pending_members_count'],
        totalFilteredMembers: json['total_filtered_members'],
        totalMembers: json['total_members'],
      );

  Map<String, dynamic> toJson() => {
        'admins_count': adminsCount,
        'community': community?.toJson(),
        'members': members,
        'members_count': membersCount,
        'pending_members_count': pendingMembersCount,
        'total_filtered_members': totalFilteredMembers,
        'total_members': totalMembers,
        'widgets': widgets?.map((key, value) => MapEntry(key, value.toJson())),
      };
}
