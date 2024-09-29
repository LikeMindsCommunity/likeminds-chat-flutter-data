import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/constant/string_constant.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

abstract class TokenManagerAbstract {}

class TokenManager {
  static TokenManager? _instance;

  static TokenManager get instance {
    _instance ??= TokenManager._internal();
    return _instance!;
  }

  TokenManager._internal();

  String? _apiKey;
  String? _accessToken;
  String? _refreshToken;

  String? get apiKey => _apiKey;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  void setApiKey(String? apiKey) {
    _apiKey = apiKey;
  }

  void setAccessToken(String? accessToken) {
    _accessToken = accessToken;
  }

  void setRefreshToken(String? refreshToken) {
    _refreshToken = refreshToken;
  }

  Future<void> updateTokens(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    // Check if running in test environment
    if (testFlag) {
      return;
    } else {
      await updateTokensInDB(accessToken, refreshToken);
    }
  }

  Future<void> updateTokensInDB(String accessToken, String refreshToken) async {
    final localPref = LMChatPersistence.instance;
    final LMChatCache accessTokenCache = (LMChatCacheBuilder()
          ..key(kAccessToken)
          ..value(accessToken))
        .build();
    final LMChatCache refreshTokenCache = (LMChatCacheBuilder()
          ..key(kRefreshToken)
          ..value(refreshToken))
        .build();

    await localPref.insertOrUpdateValueInCache(accessTokenCache);
    await localPref.insertOrUpdateValueInCache(refreshTokenCache);
  }

  void clearTokens() {
    _accessToken = null;
    _refreshToken = null;
  }
}
