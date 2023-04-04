class MarkReadChatroomRequest {
  final int chatroomId;

  MarkReadChatroomRequest({required this.chatroomId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['chatroom_id'] = chatroomId.toString();
    return data;
  }
}
