import 'package:likeminds_chat_fl/src/models/auth/user_model.dart';

class GetAllMembersRequest {
  int? memberState;
  int? page;
  bool? excludeSelfUser;
  List<UserRole>? filterMemberRoles;
  GetAllMembersRequest._({
     this.memberState,
    this.page,
    this.excludeSelfUser,
    this.filterMemberRoles,
  });

  Map<String, dynamic> toJson() => {
        "member_state": memberState,
        "page": page,
        "exclude_self_user": excludeSelfUser,
        "filter_member_roles": filterMemberRoles?.map((e) => e.value).toList(),
      };
}

class GetAllMembersRequestBuilder {
  GetAllMembersRequestBuilder();

  int? _memberState;
  int? _page;
  bool? _excludeSelfUser;
  List<UserRole>? _filterMemberRoles;

  void memberState(int memberState) => _memberState = memberState;
  void page(int page) => _page = page;
  void excludeSelfUser(bool excludeSelfUser) =>
      _excludeSelfUser = excludeSelfUser;
  void filterMemberRoles(List<UserRole> filterMemberRoles) =>
      _filterMemberRoles = filterMemberRoles;

  GetAllMembersRequest build() {
    return GetAllMembersRequest._(
      memberState: _memberState,
      page: _page,
      excludeSelfUser: _excludeSelfUser,
      filterMemberRoles: _filterMemberRoles,
    );
  }
}
