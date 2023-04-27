class PutMediaRequest {
  final int conversationId;
  final String url;
  final int filesCount;
  final int index;
  final double height;
  final double width;
  final dynamic meta;

  PutMediaRequest._({
    required this.conversationId,
    required this.url,
    required this.filesCount,
    required this.index,
    required this.height,
    required this.width,
    required this.meta,
  });

  Map<String, dynamic> toJson() {
    return {
      "conversation_id": conversationId,
      "url": url,
      "files_count": filesCount,
      "index": index,
      "height": height,
      "width": width,
      "meta": meta,
    };
  }
}

class PutMediaRequestBuilder {
  int? _conversationId;
  String? _url;
  int? _filesCount;
  int? _index;
  double? _height;
  double? _width;
  dynamic? _meta;

  void conversationId(int conversationId) => _conversationId = conversationId;
  void url(String url) => _url = url;
  void filesCount(int filesCount) => _filesCount = filesCount;
  void height(double height) => _height = height;
  void width(double width) => _width = width;
  void meta(dynamic meta) => _meta = meta;

  PutMediaRequest build() {
    final int? conversationId = _conversationId;
    final String? url = _url;
    final int? filesCount = _filesCount;
    final int? index = _index;
    final double? height = _height;
    final double? width = _width;
    final dynamic meta = _meta;

    if (conversationId == null) {
      throw StateError('Conversation ID is required');
    }
    if (url == null) {
      throw StateError('url is required');
    }
    if (filesCount == null) {
      throw StateError('files count is required');
    }
    if (index == null) {
      throw StateError('Message text is required');
    }
    if (height == null) {
      throw StateError('chatroomId is required');
    }
    if (width == null) {
      throw StateError('expiryTime is required');
    }
    if (meta == null) {
      throw StateError('meta is required for this builder');
    }

    return PutMediaRequest._(
      conversationId: conversationId,
      url: url,
      filesCount: filesCount,
      index: index,
      height: height,
      width: width,
      meta: meta,
    );
  }
}
