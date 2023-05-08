class GetConversationRequest {
  final int chatroomId;
  final int page;
  final int pageSize;
  final int maxTimestamp;
  final int minTimestamp;
  final bool isLocalDB;

  GetConversationRequest._(
      {required this.chatroomId,
      required this.page,
      required this.pageSize,
      required this.maxTimestamp,
      required this.minTimestamp,
      this.isLocalDB = false,});

  toJson() {
    return {
      "chatroom_id": chatroomId,
      "page": page,
      "page_size": pageSize,
      "max_timestamp": maxTimestamp,
      "min_timestamp": minTimestamp,
      "is_local_db": isLocalDB,
    };
  }
}

class GetConversationRequestBuilder {
  int? _chatroomId;
  int? _page;
  int? _pageSize;
  int? _maxTimestamp;
  int? _minTimestamp;
  bool? _isLocalDB;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  void maxTimestamp(int maxTimestamp) {
    _maxTimestamp = maxTimestamp;
  }

  void minTimestamp(int minTimestamp) {
    _minTimestamp = minTimestamp;
  }

  void isLocalDB(bool isLocalDB) {
    _isLocalDB = isLocalDB;
  }

  GetConversationRequest build() {
    return GetConversationRequest._(
      chatroomId: _chatroomId ?? 0,
      page: _page ?? 0,
      pageSize: _pageSize ?? 0,
      maxTimestamp: _maxTimestamp ?? 0,
      minTimestamp: _minTimestamp ?? 0,
      isLocalDB: _isLocalDB ?? false,
    );
  }
}
