class GetChatroomRequest {
  final int chatroomId;
  final int? page;
  final int? pageSize;

  GetChatroomRequest({
    required this.chatroomId,
    this.page,
    this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'chatroom_id': chatroomId,
      'page': page,
      'page_size': pageSize,
    };
  }
}
