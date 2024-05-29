class FetchDMFeedRequest {
  final int page;
  final int pageSize;
  final int maxTimestamp;
  final int minTimestamp;
  final List<int> chatroomTypes;
  final bool isLocalDb;

  FetchDMFeedRequest._({
    required this.page,
    required this.pageSize,
    required this.maxTimestamp,
    required this.minTimestamp,
    required this.chatroomTypes,
    this.isLocalDb = false,
  });

  Map<String, dynamic> toJson() => {
        'page': page,
        'page_size': pageSize,
        'max_timestamp': maxTimestamp,
        'min_timestamp': minTimestamp,
        'chatroom_types': chatroomTypes.toList(),
        'is_local_db': isLocalDb,
      };
}

class FetchDMFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  int? _maxTimestamp;
  int? _minTimestamp;
  List<int>? _chatroomTypes;
  bool? _isLocalDb;

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) => _pageSize = pageSize;
  void maxTimestamp(int maxTimestamp) => _maxTimestamp = maxTimestamp;
  void minTimestamp(int minTimestamp) => _minTimestamp = minTimestamp;
  void chatroomTypes(List<int> chatroomTypes) => _chatroomTypes = chatroomTypes;
  void isLocalDb(bool isLocalDb) => _isLocalDb = isLocalDb;

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
      chatroomTypes: _chatroomTypes ?? [10],
      isLocalDb: _isLocalDb ?? false,
    );
  }
}
