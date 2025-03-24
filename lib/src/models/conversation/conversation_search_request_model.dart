class ConversationSearchRequestModel {
  final String searchTerm;
  final bool followStatus;
  final int page;
  final int pageSize;
  final int chatroomId;

  ConversationSearchRequestModel._({
    required this.searchTerm,
    required this.followStatus,
    required this.page,
    required this.pageSize,
    required this.chatroomId,
  });

  Map<String, dynamic> toJson() {
    return {
      'search': searchTerm,
      'follow_status': followStatus,
      'page': page,
      'page_size': pageSize,
      'chatroom_id': chatroomId,
    };
  }
}

class ConversationSearchRequestModelBuilder {
  ConversationSearchRequestModelBuilder();

  String? _searchTerm;
  bool? _followStatus;
  int? _page;
  int? _pageSize;
  int? _chatroomId;

  void searchTerm(String searchTerm) => _searchTerm = searchTerm;
  void followStatus(bool followStatus) => _followStatus = followStatus;
  void page(int page) => _page = page;
  void pageSize(int pageSize) => _pageSize = pageSize;
  void chatroomId(int chatroomId) => _chatroomId = chatroomId;

  ConversationSearchRequestModel build() {
    if (_searchTerm == null) {
      throw StateError('searchTerm is required');
    }
    if (_followStatus == null) {
      throw StateError('followStatus is required');
    }
    if (_page == null) {
      throw StateError('page is required');
    }
    if (_pageSize == null) {
      throw StateError('pageSize is required');
    }
    if (_chatroomId == null) {
      throw StateError('chatroomId is required');
    }

    return ConversationSearchRequestModel._(
      searchTerm: _searchTerm!,
      followStatus: _followStatus!,
      page: _page!,
      pageSize: _pageSize!,
      chatroomId: _chatroomId!,
    );
  }
}
