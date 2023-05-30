class GetParticipantsRequest {
  final int chatroomId;
  final int page;
  final int pageSize;
  final bool isSecret;
  final String? search;

  GetParticipantsRequest._({
    required this.chatroomId,
    required this.page,
    required this.pageSize,
    required this.isSecret,
    this.search,
  });

  Map<String, dynamic> toJson() {
    return {
      "chatroom_id": chatroomId,
      "page": page,
      "page_size": pageSize,
      "is_secret": isSecret,
      "participant_name": search,
    };
  }
}

class GetParticipantsRequestBuilder {
  int? _chatroomId;
  int? _page;
  int? _pageSize;
  bool? _isSecret;
  String? _search;

  GetParticipantsRequestBuilder();

  void chatroomId(int chatroomId) => _chatroomId = chatroomId;
  void page(int page) => _page = page;
  void pageSize(int pageSize) => _pageSize = pageSize;
  void isSecret(bool isSecret) => _isSecret = isSecret;
  void search(String? search) => _search = search;

  GetParticipantsRequest build() {
    final int? chatroomId = _chatroomId;
    final int? page = _page;
    final int? pageSize = _pageSize;
    final bool? isSecret = _isSecret;
    final String? search = _search;

    if (chatroomId == null) {
      throw StateError("ChatRoom ID is required");
    }
    if (page == null) {
      throw StateError("Page is required");
    }
    if (pageSize == null) {
      throw StateError("Page size is required");
    }
    if (isSecret == null) {
      throw StateError("is Secret boolean is required");
    }

    return GetParticipantsRequest._(
      chatroomId: chatroomId,
      page: page,
      pageSize: pageSize,
      isSecret: isSecret,
      search: search,
    );
  }
}
