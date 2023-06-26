class PutMediaRequest {
  final int conversationId;
  final String url;
  final int filesCount;
  final int index;
  final int? height;
  final int? width;
  final String type;
  final dynamic meta;
  final String? thumbnailUrl;

  PutMediaRequest._({
    required this.conversationId,
    required this.url,
    required this.filesCount,
    required this.index,
    required this.height,
    required this.width,
    required this.meta,
    required this.type,
    this.thumbnailUrl,
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
      "type": type,
      "thumbnail_url": thumbnailUrl ?? "",
    };
  }
}

class PutMediaRequestBuilder {
  int? _conversationId;
  String? _url;
  int? _filesCount;
  int? _index;
  int? _height;
  int? _width;
  dynamic _meta;
  String? _type;
  String? _thumbnailUrl;

  void conversationId(int conversationId) => _conversationId = conversationId;
  void url(String url) => _url = url;
  void filesCount(int filesCount) => _filesCount = filesCount;
  void height(int? height) => _height = height;
  void width(int? width) => _width = width;
  void meta(dynamic meta) => _meta = meta;
  void index(int index) => _index = index;
  void type(String type) => _type = type;
  void thumbnailUrl(String? thumbnailUrl) => _thumbnailUrl = thumbnailUrl;

  PutMediaRequest build() {
    final int? conversationId = _conversationId;
    final String? url = _url;
    final int? filesCount = _filesCount;
    final int? index = _index;
    final int? height = _height;
    final int? width = _width;
    final dynamic meta = _meta;
    final String? type = _type;

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
      throw StateError('index is required');
    }
    if (meta == null) {
      throw StateError('meta is required for this builder');
    }

    if (type == null) {
      throw StateError('type is required for this builder');
    }

    return PutMediaRequest._(
      conversationId: conversationId,
      url: url,
      filesCount: filesCount,
      index: index,
      height: height,
      width: width,
      meta: meta,
      type: type,
      thumbnailUrl: _thumbnailUrl,
    );
  }
}
