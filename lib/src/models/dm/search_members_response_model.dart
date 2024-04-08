import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/dm/dm_search_member_model.dart';
part 'search_members_response_model.g.dart';

class SearchMembersResponse {
  final bool success;
  final String? errorMessage;
  final List<DMSearchMember>? members;

  SearchMembersResponse({
    required this.success,
    this.errorMessage,
    this.members,
  });

  factory SearchMembersResponse.fromEntity(SearchMembersResponseEntity entity) {
    return SearchMembersResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      members:
          entity.members?.map((e) => DMSearchMember.fromEntity(e)).toList(),
    );
  }

  SearchMembersResponseEntity toEntity() {
    return SearchMembersResponseEntity(
      success: success,
      errorMessage: errorMessage,
      members: members?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class SearchMembersResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final List<DMSearchMemberEntity>? members;

  SearchMembersResponseEntity({
    required this.success,
    this.errorMessage,
    this.members,
  });
  factory SearchMembersResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchMembersResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMembersResponseEntityToJson(this);
}
