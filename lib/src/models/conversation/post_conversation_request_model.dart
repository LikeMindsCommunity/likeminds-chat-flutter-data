import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class PostConversationRequest {
  final String text;
  final int chatroomId;
  final int? expiryTime;
  final int? replyId;
  final String temporaryId;
  final bool hasFiles;
  final int attachmentCount;
  final OgTags? ogTags;
  final String? shareLink;

  PostConversationRequest._({
    required this.text,
    required this.chatroomId,
    required this.temporaryId,
    this.expiryTime,
    this.replyId,
    required this.hasFiles,
    this.attachmentCount = 0,
    this.ogTags,
    this.shareLink,
  });

  toJson() {
    return {
      'text': text,
      'chatroom_id': chatroomId,
      'expiry_time': expiryTime,
      'replied_conversation_id': replyId,
      'temporary_id': temporaryId,
      'has_files': hasFiles,
      'attachment_count': attachmentCount,
      'og_tags': ogTags?.toEntity().toJson(),
      'share_link': shareLink,
    };
  }
}

class PostConversationRequestBuilder {
  PostConversationRequestBuilder();

  String? _text;
  int? _chatroomId;
  int? _expiryTime;
  int? _replyId;
  String? _temporaryId;
  bool? _hasFiles;
  int? _attachmentCount;
  OgTags? _ogTags;
  String? _shareLink;

  void text(String text) => _text = text;
  void chatroomId(int chatroomId) => _chatroomId = chatroomId;
  void expiryTime(int expiryTime) => _expiryTime = expiryTime;
  void replyId(int? replyId) => _replyId = replyId;
  void temporaryId(String temporaryId) => _temporaryId = temporaryId;
  void hasFiles(bool hasFiles) => _hasFiles = hasFiles;
  void attachmentCount(int attachmentCount) =>
      _attachmentCount = attachmentCount;
  void ogTags(OgTags ogTags) => _ogTags = ogTags;
  void shareLink(String shareLink) => _shareLink = shareLink;

  PostConversationRequest build() {
    final text = _text;
    final chatroomId = _chatroomId;
    final expiryTime = _expiryTime;
    final replyId = _replyId;
    final temporaryId = _temporaryId;

    if (text == null) {
      throw StateError('Message text is required');
    }
    if (chatroomId == null) {
      throw StateError('chatroomId is required');
    }
    if (temporaryId == null) {
      throw StateError('temporaryId is required');
    }
    return PostConversationRequest._(
      text: text,
      chatroomId: chatroomId,
      expiryTime: expiryTime,
      replyId: replyId,
      temporaryId: temporaryId,
      attachmentCount: _attachmentCount ?? 0,
      hasFiles: _hasFiles ?? false,
      ogTags: _ogTags,
      shareLink: _shareLink,
    );
  }
}
