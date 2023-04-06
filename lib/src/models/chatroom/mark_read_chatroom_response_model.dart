class MarkReadChatroomResponse {
  final bool success;
  final String? errorMessage;

  MarkReadChatroomResponse({required this.success, this.errorMessage});

  factory MarkReadChatroomResponse.fromJson(Map<String, dynamic> json) {
    return MarkReadChatroomResponse(
      success: json['success'],
      errorMessage: json['error_message'],
    );
  }
}
