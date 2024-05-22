class GetAllMembersRequest {
  int memberState;
  int? page;
  GetAllMembersRequest._({
    required this.memberState,
    this.page,
  });

  Map<String, dynamic> toJson() => {
        "member_state": memberState,
        "page": page,
      };
}

class GetAllMembersRequestBuilder {
  GetAllMembersRequestBuilder();

  int? _memberState;
  int? _page;

  void memberState(int memberState) => _memberState = memberState;
  void page(int page) => _page = page;

  GetAllMembersRequest build() {
    return GetAllMembersRequest._(
      memberState: _memberState!,
      page: _page,
    );
  }
}
