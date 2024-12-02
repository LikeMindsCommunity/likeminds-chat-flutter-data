class GetAIChatbotsRequest {
  final int page;
  final int pageSize;

  GetAIChatbotsRequest._({
    required this.page,
    required this.pageSize,
  });

  toJson() {
    return {
      'page': page,
      'page_size': pageSize,
    };
  }
}

class GetAIChatbotsRequestBuilder {
  GetAIChatbotsRequestBuilder();

  int? _page;
  int? _pageSize;

  void page(int page) => _page = page;
  void pageSize(int pageSize) => _pageSize = pageSize;

  GetAIChatbotsRequest build() {
    final page = _page;
    final pageSize = _pageSize;

    if (page == null) {
      throw StateError('page is required');
    }
    if (pageSize == null) {
      throw StateError('pageSize is required');
    }

    return GetAIChatbotsRequest._(
      page: page,
      pageSize: pageSize,
    );
  }
}
