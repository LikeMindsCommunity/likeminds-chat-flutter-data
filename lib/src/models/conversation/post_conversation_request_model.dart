import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class PostConversationRequest {
  final String text;
  final int chatroomId;
  final int? expiryTime;
  final int? replyId;
  final String temporaryId;
  final bool hasFiles;
  final List<Attachment>? attachments;
  final OgTags? ogTags;
  final String? shareLink;
  final bool? triggerBot;
  final Map<String, dynamic>? metadata;

  PostConversationRequest._({
    required this.text,
    required this.chatroomId,
    required this.temporaryId,
    this.expiryTime,
    this.replyId,
    required this.hasFiles,
    this.attachments,
    this.ogTags,
    this.shareLink,
    this.triggerBot,
    this.metadata,
  });

  toJson() {
    return {
      'text': text,
      'chatroom_id': chatroomId,
      'expiry_time': expiryTime,
      'replied_conversation_id': replyId,
      'temporary_id': temporaryId,
      'has_files': hasFiles,
      'attachments': attachments?.map((e) => e.toEntity().toJson()).toList(),
      'og_tags': ogTags?.toEntity().toJson(),
      'share_link': shareLink,
      'trigger_bot': triggerBot ?? false,
      'metadata': metadata,
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
  List<Attachment>? _attachments;
  OgTags? _ogTags;
  String? _shareLink;
  bool? _triggerBot;
  Map<String, dynamic>? _metadata;

  void text(String text) => _text = text;
  void chatroomId(int chatroomId) => _chatroomId = chatroomId;
  void expiryTime(int expiryTime) => _expiryTime = expiryTime;
  void replyId(int? replyId) => _replyId = replyId;
  void temporaryId(String temporaryId) => _temporaryId = temporaryId;
  void hasFiles(bool hasFiles) => _hasFiles = hasFiles;
  void attachments(List<Attachment> attachments) => _attachments = attachments;
  void ogTags(OgTags ogTags) => _ogTags = ogTags;
  void shareLink(String shareLink) => _shareLink = shareLink;
  void triggerBot(bool triggerBot) => _triggerBot = triggerBot;
  void metadata(Map<String, dynamic> metadata) => _metadata = metadata;

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
      attachments: _attachments,
      hasFiles: _hasFiles ?? false,
      ogTags: _ogTags,
      shareLink: _shareLink,
      triggerBot: _triggerBot,
      metadata: _metadata,
    );
  }
}
