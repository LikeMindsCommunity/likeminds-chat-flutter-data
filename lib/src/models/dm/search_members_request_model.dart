class SearchMembersRequest {
  final String search;
  final String searchType;
  final String? orderType;
  final List<int>? memberStates;
  final int? page;
  final int? pageSize;
  final String? questionAnswersVersion;

  SearchMembersRequest._({
    required this.search,
    required this.searchType,
    required this.orderType,
    required this.memberStates,
    required this.page,
    required this.pageSize,
    required this.questionAnswersVersion,
  });

  Map<String, dynamic> toJson() {
    return {
      "search": search,
      "search_type": searchType,
      "order_type": orderType,
      "member_states": memberStates,
      "page": page,
      "page_size": pageSize,
      "question_answers_version": questionAnswersVersion
    };
  }
}

class SearchMemberRequestBuilder {
  SearchMemberRequestBuilder();

  String? _search;
  String? _searchType;
  String? _orderType;
  List<int>? _memberStates;
  int? _page;
  int? _pageSize;
  String? _questionAnswersVersion;

  void search(String search) => _search = search;
  void searchType(String searchType) => _searchType = searchType;
  void orderType(String orderType) => _orderType = orderType;
  void memberStates(List<int> memberStates) => _memberStates = memberStates;
  void page(int page) => _page = page;
  void pageSize(int pageSize) => _pageSize = pageSize;
  void questionAnswersVersion(String questionAnswersVersion) =>
      _questionAnswersVersion = questionAnswersVersion;

  SearchMembersRequest build() {
    final search = _search;
    final searchType = _searchType;
    if (search == null) {
      throw StateError("search is required");
    }
    if (searchType == null) {
      throw StateError("searchType is required");
    }

    return SearchMembersRequest._(
        search: search,
        searchType: searchType,
        orderType: _orderType,
        memberStates: _memberStates,
        page: _page,
        pageSize: _pageSize,
        questionAnswersVersion: _questionAnswersVersion);
  }
}
