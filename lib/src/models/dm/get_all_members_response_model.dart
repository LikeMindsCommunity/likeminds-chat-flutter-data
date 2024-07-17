import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
part 'get_all_members_response_model.g.dart';

class GetAllMembersResponse {
  final List<DmAllMember>? members;

  GetAllMembersResponse({
    this.members,
  });

  factory GetAllMembersResponse.fromEntity(GetAllMembersResponseEntity entity) {
    return GetAllMembersResponse(
      members: entity.members?.map((e) => DmAllMember.fromEntity(e)).toList(),
    );
  }

  GetAllMembersResponseEntity toEntity() {
    return GetAllMembersResponseEntity(
      members: members?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetAllMembersResponseEntity {
  final List<DmAllMemberEntity>? members;

  GetAllMembersResponseEntity({
    this.members,
  });

  factory GetAllMembersResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllMembersResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllMembersResponseEntityToJson(this);
}
