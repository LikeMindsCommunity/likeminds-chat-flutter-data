class GetExploreFeedRequest {
  final int page;
  final int orderType;
  final bool pinned;

  GetExploreFeedRequest._({
    required this.page,
    required this.orderType,
    required this.pinned,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'order_type': orderType,
      'pinned': pinned,
    };
  }
}

class GetExploreFeedRequestBuilder {
  int? _page;
  int? _orderType;
  bool? _pinned;

  void page(int page) => _page = page;
  void orderType(int orderType) => _orderType = orderType;
  void pinned(bool pinned) => _pinned = pinned;

  GetExploreFeedRequest build() {
    return GetExploreFeedRequest._(
      page: _page!,
      orderType: _orderType!,
      pinned: _pinned!,
    );
  }
}
