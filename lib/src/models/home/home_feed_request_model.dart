class GetHomeFeedRequest {
  final int? page;
  final int? pageSize;

  GetHomeFeedRequest._({
    this.page,
    this.pageSize,
  });

  toJson() => {
        'page': page,
        'page_size': pageSize,
      };
}

class GetHomeFeedRequestBuilder {
  int? _page;
  int? _pageSize;

  void page(int page) => _page = page;
  void pageSize(int pageSize) => _pageSize = pageSize;

  GetHomeFeedRequest build() {
    return GetHomeFeedRequest._(
      page: _page,
      pageSize: _pageSize,
    );
  }
}
