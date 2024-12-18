import 'dart:convert';

enum OrderBy {
  ascending("ASC"),
  descending("DESC");

  final String value;
  const OrderBy(this.value);
}

class GetConversationRequest {
  final int chatroomId;
  final int page;
  final int pageSize;
  final int maxTimestamp;
  final int minTimestamp;
  final bool isLocalDB;
  final int? conversationId;
  final List<int>? excludedConversationStates;
  final OrderBy? orderBy;

  GetConversationRequest._({
    required this.chatroomId,
    required this.page,
    required this.pageSize,
    required this.maxTimestamp,
    required this.minTimestamp,
    this.conversationId,
    this.isLocalDB = false,
    this.excludedConversationStates,
    this.orderBy,
  });

  toJson() {
    return {
      "chatroom_id": chatroomId,
      "page": page,
      "page_size": pageSize,
      "max_timestamp": maxTimestamp,
      "min_timestamp": minTimestamp,
      "is_local_db": isLocalDB,
      "conversation_id": conversationId,
      "excluded_conversation_states": jsonEncode(excludedConversationStates),
      "order_by": orderBy?.value,
    };
  }

  GetConversationRequest copyWith({
    int? chatroomId,
    int? page,
    int? pageSize,
    int? maxTimestamp,
    int? minTimestamp,
    bool? isLocalDB,
    int? conversationId,
    List<int>? excludedConversationStates,
    OrderBy? orderBy,
  }) {
    return GetConversationRequest._(
      chatroomId: chatroomId ?? this.chatroomId,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      maxTimestamp: maxTimestamp ?? this.maxTimestamp,
      minTimestamp: minTimestamp ?? this.minTimestamp,
      isLocalDB: isLocalDB ?? this.isLocalDB,
      conversationId: conversationId ?? this.conversationId,
      excludedConversationStates:
          excludedConversationStates ?? this.excludedConversationStates,
      orderBy: orderBy ?? this.orderBy,
    );
  }
}

class GetConversationRequestBuilder {
  int? _chatroomId;
  int? _page;
  int? _pageSize;
  int? _maxTimestamp;
  int? _minTimestamp;
  bool? _isLocalDB;
  int? _conversationId;
  List<int>? _excludedConversationStates;
  OrderBy? _orderBy;

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

  void conversationId(int conversationId) {
    _conversationId = conversationId;
  }

  void excludedConversationStates(List<int> states) {
    _excludedConversationStates = states;
  }

  void orderBy(OrderBy orderBy) {
    _orderBy = orderBy;
  }

  GetConversationRequest build() {
    return GetConversationRequest._(
      chatroomId: _chatroomId ?? 0,
      page: _page ?? 0,
      pageSize: _pageSize ?? 0,
      maxTimestamp: _maxTimestamp ?? 0,
      minTimestamp: _minTimestamp ?? 0,
      isLocalDB: _isLocalDB ?? false,
      conversationId: _conversationId,
      excludedConversationStates: _excludedConversationStates,
      orderBy: _orderBy,
    );
  }
}
