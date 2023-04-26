class TagRequestModel {
  final int? chatroomId;
  final int? page;
  final int? pageSize;
  final String? searchQuery;

  TagRequestModel._({
    this.chatroomId,
    this.page,
    this.pageSize,
    this.searchQuery,
  });

  Map<String, dynamic> toJson() {
    return {
      'chatroom_id': chatroomId,
      'page': page,
      'page_size': pageSize,
      'search_query': searchQuery,
    };
  }
}

class TagRequestModelBuilder {
  int? _chatroomId;
  int? _page;
  int? _pageSize;
  String? _searchQuery;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void searchQuery(String searchQuery) {
    _searchQuery = searchQuery;
  }

  TagRequestModel build() {
    return TagRequestModel._(
      chatroomId: _chatroomId,
      page: _page,
      pageSize: _pageSize,
      searchQuery: _searchQuery,
    );
  }
}
