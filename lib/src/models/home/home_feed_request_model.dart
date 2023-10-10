class GetHomeFeedRequest {
  final int? page;
  final int? pageSize;
  final int? minTimestamp;
  final int? maxTimestamp;
  final List<int>? chatroomTypes;

  GetHomeFeedRequest._({
    this.page,
    this.pageSize,
    this.minTimestamp,
    this.maxTimestamp,
    this.chatroomTypes,
  });

  toJson() => {
        'page': page,
        'page_size': pageSize,
        'min_timestamp': minTimestamp,
        'max_timestamp': maxTimestamp,
        'chatroom_types': chatroomTypes,
      };
}

class GetHomeFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  int? _minTimestamp;
  int? _maxTimestamp;
  List<int>? _chatroomTypes;

  void page(int page) => _page = page;
  void pageSize(int pageSize) => _pageSize = pageSize;
  void minTimestamp(int minTimestamp) => _minTimestamp = minTimestamp;
  void maxTimestamp(int maxTimestamp) => _maxTimestamp = maxTimestamp;
  void chatroomTypes(List<int> chatroomTypes) => _chatroomTypes = chatroomTypes;

  GetHomeFeedRequest build() {
    return GetHomeFeedRequest._(
      page: _page,
      pageSize: _pageSize,
      minTimestamp: _minTimestamp,
      maxTimestamp: _maxTimestamp,
      chatroomTypes: _chatroomTypes,
    );
  }
}
