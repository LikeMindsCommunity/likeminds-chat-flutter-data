class FetchDMFeedRequest {
  int page;

  FetchDMFeedRequest._({required this.page});

  Map<String, dynamic> toJson() => {
        'page': page,
      };
}

class FetchDMFeedRequestBuilder {
  int? _page;

  void page(int page) {
    _page = page;
  }

  FetchDMFeedRequest build() {
    if (_page == null) {
      throw Exception("Page is required");
    }
    return FetchDMFeedRequest._(
      page: _page!,
    );
  }
}
