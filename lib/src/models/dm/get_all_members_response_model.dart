import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
part 'get_all_members_response_model.g.dart';

class GetAllMembersResponse {
  final bool success;
  final String? errorMessage;
  final List<DmAllMember>? members;

  GetAllMembersResponse({
    required this.success,
    this.errorMessage,
    this.members,
  });

  factory GetAllMembersResponse.fromEntity(GetAllMembersResponseEntity entity) {
    return GetAllMembersResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      members: entity.members?.map((e) => DmAllMember.fromEntity(e)).toList(),
    );
  }

  GetAllMembersResponseEntity toEntity() {
    return GetAllMembersResponseEntity(
      success: success,
      errorMessage: errorMessage,
      members: members?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetAllMembersResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final List<DmAllMemberEntity>? members;

  GetAllMembersResponseEntity({
    required this.success,
    this.errorMessage,
    this.members,
  });

  factory GetAllMembersResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllMembersResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllMembersResponseEntityToJson(this);
}
