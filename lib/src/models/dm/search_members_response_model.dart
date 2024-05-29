import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/dm/dm_search_member_model.dart';
part 'search_members_response_model.g.dart';

class SearchMembersResponse {
  final List<DMSearchMember>? members;

  SearchMembersResponse({
    this.members,
  });

  factory SearchMembersResponse.fromEntity(SearchMembersResponseEntity entity) {
    return SearchMembersResponse(
      members:
          entity.members?.map((e) => DMSearchMember.fromEntity(e)).toList(),
    );
  }

  SearchMembersResponseEntity toEntity() {
    return SearchMembersResponseEntity(
      members: members?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class SearchMembersResponseEntity {
  final List<DMSearchMemberEntity>? members;

  SearchMembersResponseEntity({
    this.members,
  });
  factory SearchMembersResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchMembersResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMembersResponseEntityToJson(this);
}
