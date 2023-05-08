abstract class TokenManagerAbstract {}

class TokenManager {
  static final TokenManager _singleton = TokenManager._internal();

  factory TokenManager() {
    return _singleton;
  }

  TokenManager._internal();

  String? _apiKey;
  String? _accessToken;
  String? _refreshToken;
  int? _userId;
  int? _communityId;

  String? get apiKey => _apiKey;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  int? get userId => _userId;
  int? get communityId => _communityId;

  void setApiKey(String? apiKey) {
    _apiKey = apiKey;
  }

  void setAccessToken(String? accessToken) {
    _accessToken = accessToken;
  }

  void setRefreshToken(String? refreshToken) {
    _refreshToken = refreshToken;
  }

  void setUserId(int? userId) {
    _userId = userId;
  }

  void setCommunityId(int? communityId) {
    _communityId = communityId;
  }

  void initTokens(String accessToken, String refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  void clearTokens() {
    _accessToken = null;
    _refreshToken = null;
    _userId = null;
    _communityId = null;
  }
}
