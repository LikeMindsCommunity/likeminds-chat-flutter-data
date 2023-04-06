class SetChatroomTopicResponse {
  final bool success;
  final String? errorMessage;

  SetChatroomTopicResponse({
    required this.success,
    this.errorMessage,
  });

  factory SetChatroomTopicResponse.fromJson(Map<String, dynamic> json) {
    return SetChatroomTopicResponse(
      success: json['success'],
      errorMessage: json['error_message'],
    );
  }
}
