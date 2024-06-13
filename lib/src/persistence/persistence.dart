import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/persistence/cache/handler/handler.dart';
import 'package:likeminds_chat_fl/src/persistence/user/handler/handler.dart';
import 'package:path_provider/path_provider.dart';

void initHive() async {
  if (!kIsWeb) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  } else {
    Hive.init(null);
  }
}

class LMFeedPersistence {
  late LMUserDBHandlerHive userDBHandlerHive;
  late LMChatCacheDBHandler cacheDBHandlerHive;

  static LMFeedPersistence? _instance;

  static LMFeedPersistence get instance => _instance ??= LMFeedPersistence._();

  LMFeedPersistence._() {
    initHive();
    userDBHandlerHive = LMUserDBHandlerHive(
      userBoxName: 'userBox',
      memberStateBoxName: 'memberStateBox',
    );
    cacheDBHandlerHive = LMChatCacheDBHandler(
      cacheBoxName: 'cacheBox',
    );
  }

  Future<LMResponse<void>> initiate() async {

    LMResponse userDBInit = await userDBHandlerHive.initiate();

    LMResponse cacheDBInit = await cacheDBHandlerHive.initiate();

    if (!userDBInit.success) {
      return LMResponse(success: false, errorMessage: userDBInit.errorMessage);
    } else if (!cacheDBInit.success) {
      return LMResponse(
          success: false, errorMessage: cacheDBInit.errorMessage);
    } else {
      return LMResponse(success: true);
    }
  }

  Future<LMResponse<void>> insertOrUpdateUser(User user) {
    return userDBHandlerHive.insertOrUpdateUser(user);
  }

  LMResponse<User> getUser() {
    return userDBHandlerHive.getUser();
  }

  Future<LMResponse<void>> deleteUser() {
    return userDBHandlerHive.deleteUser();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMChatCache cache) {
    return cacheDBHandlerHive.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) {
    return cacheDBHandlerHive.deleteValueFromCache(key);
  }

  LMResponse<LMChatCache> getCache(String key) {
    return cacheDBHandlerHive.getValueFromCache(key);
  }

  Future<LMResponse<void>> clearCache() {
    return cacheDBHandlerHive.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) {
    return userDBHandlerHive.insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return userDBHandlerHive.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() {
    return userDBHandlerHive.deleteMemberState();
  }
}
