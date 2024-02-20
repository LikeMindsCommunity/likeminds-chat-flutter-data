class GetHomeFeedRequest {
  final int page;
  final int? pageSize;
  final List<int>? chatroomType;
  final int? minTimeStamp;
  final int? maxTimeStamp;
  final bool? isLocalDB;

  GetHomeFeedRequest._({
    required this.page,
    this.pageSize = 20,
    this.chatroomType,
    this.isLocalDB,
    this.maxTimeStamp,
    this.minTimeStamp,
  });

  toJson() => {
        'page': page,
        'page_size': pageSize,
        'min_timestamp': minTimeStamp,
        'max_timestamp': maxTimeStamp,
        'chatroom_type': chatroomType,
        'is_local_db': isLocalDB,
      };
}

class GetHomeFeedRequestBuilder {
  int? _page;
  int? _pageSize;
  int? _minTimeStamp;
  int? _maxTimeStamp;
  List<int>? _chatroomType;
  bool? _isLocalDB;

  void page(int page) => _page = page;
  void pageSize(int pageSize) => _pageSize = pageSize;
  void minTimeStamp(int minTimeStamp) => _minTimeStamp = minTimeStamp;
  void maxTimeStamp(int maxTimeStamp) => _maxTimeStamp = maxTimeStamp;
  void chatroomType(List<int> chatroomType) => _chatroomType = chatroomType;
  void isLocalDB(bool isLocalDB) => _isLocalDB = isLocalDB;

  GetHomeFeedRequest build() {
    return GetHomeFeedRequest._(
      page: _page!,
      pageSize: _pageSize,
      minTimeStamp: _minTimeStamp,
      maxTimeStamp: _maxTimeStamp,
      chatroomType: _chatroomType,
      isLocalDB: _isLocalDB,
    );
  }
}
