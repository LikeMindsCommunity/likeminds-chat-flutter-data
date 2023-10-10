class FetchDMFeedRequest {
  int page;
  int pageSize;
  int maxTimestamp;
  int minTimestamp;
  List<int>? chatroomTypes;

  FetchDMFeedRequest._({
    required this.page,
    required this.pageSize,
    required this.maxTimestamp,
    required this.minTimestamp,
    this.chatroomTypes,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'max_timestamp': maxTimestamp,
        'min_timestamp': minTimestamp,
        'chatroom_types': chatroomTypes.toString(),
      };
}

class FetchDMFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  int? _maxTimestamp;
  int? _minTimestamp;
  List<int>? _chatroomTypes;

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) => _pageSize = pageSize;
  void maxTimestamp(int maxTimestamp) => _maxTimestamp = maxTimestamp;
  void minTimestamp(int minTimestamp) => _minTimestamp = minTimestamp;
  void chatroomTypes(List<int> chatroomTypes) => _chatroomTypes = chatroomTypes;

  FetchDMFeedRequest build() {
    if (_page == null) {
      throw Exception("Page is required");
    }
    if (_pageSize == null) {
      throw StateError("PageSize is required");
    }
    if (_maxTimestamp == null) {
      throw StateError("maxTimestamp is required");
    }
    if (_minTimestamp == null) {
      throw StateError("minTimestamp is required");
    }
    if (_chatroomTypes == null) {
      throw StateError("chatroomTypes is required");
    }
    return FetchDMFeedRequest._(
      page: _page!,
      pageSize: _pageSize!,
      maxTimestamp: _maxTimestamp!,
      minTimestamp: _minTimestamp!,
      chatroomTypes: _chatroomTypes!,
    );
  }
}
