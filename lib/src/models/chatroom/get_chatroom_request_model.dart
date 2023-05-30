class GetChatroomRequest {
  final int chatroomId;
  final int? page;
  final int? pageSize;

  GetChatroomRequest._({
    required this.chatroomId,
    this.page,
    this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'chatroom_id': chatroomId,
      'page': page,
      'page_size': pageSize,
    };
  }
}

class GetChatroomRequestBuilder {
  int? _chatroomId;
  int? _page;
  int? _pageSize;

  void chatroomId(int chatroomId) {
    _chatroomId = chatroomId;
  }

  void page(int page) {
    _page = page;
  }

  void pageSize(int pageSize) {
    _pageSize = pageSize;
  }

  GetChatroomRequest build() {
    if (_chatroomId == null) {
      throw StateError("Chatroom id is required");
    }
    return GetChatroomRequest._(
      chatroomId: _chatroomId!,
      page: _page,
      pageSize: _pageSize,
    );
  }
}
