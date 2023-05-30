class RefreshRequest {
  final String refreshToken;

  RefreshRequest._({required this.refreshToken});
}

class RefreshRequestBuilder {
  String? _refreshToken;

  void refreshTokem(String refreshToken) {
    _refreshToken = refreshToken;
  }

  RefreshRequest build() {
    if (_refreshToken == null) throw StateError("Refresh token is required");

    return RefreshRequest._(refreshToken: _refreshToken!);
  }
}
