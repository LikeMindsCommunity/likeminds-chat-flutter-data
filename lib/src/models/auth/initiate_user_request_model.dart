class InitiateUserRequest {
  final String? userName;
  final String? userId;
  final bool? isGuest;
  final String? imageUrl;
  final String? apiKey;

  InitiateUserRequest._({
    this.userName,
    this.userId,
    this.isGuest,
    this.imageUrl,
    this.apiKey,
  });

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'user_unique_id': userId,
        'is_guest': isGuest,
        'image_url': imageUrl,
        "token_expiry_beta": 1,
        "rtm_token_expiry_beta": 2
      };
}

class InitiateUserRequestBuilder {
  String? _userName;
  String? _userId;
  bool? _isGuest;
  String? _imageUrl;
  String? _apiKey;

  void userName(String userName) {
    _userName = userName;
  }

  void userId(String userId) {
    _userId = userId;
  }

  void isGuest(bool isGuest) {
    _isGuest = isGuest;
  }

  void imageUrl(String imageUrl) {
    _imageUrl = imageUrl;
  }

  void apiKey(String apiKey) {
    _apiKey = apiKey;
  }

  InitiateUserRequest build() {
    return InitiateUserRequest._(
      userName: _userName,
      userId: _userId,
      isGuest: _isGuest,
      imageUrl: _imageUrl,
      apiKey: _apiKey,
    );
  }
}
