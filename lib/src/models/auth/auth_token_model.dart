class LMAuthToken {
  final String accessToken;
  final String refreshToken;

  LMAuthToken._({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}

class LMAuthTokenBuilder {
  String? _accessToken;
  String? _refreshToken;

  void accessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void refreshToken(String refreshToken) {
    _refreshToken = refreshToken;
  }

  LMAuthToken build() {
    if (_accessToken == null || _refreshToken == null) {
      throw Exception('Access token and refresh token are required');
    }
    return LMAuthToken._(
      accessToken: _accessToken!,
      refreshToken: _refreshToken!,
    );
  }
}
