// ignore_for_file: lines_longer_than_80_chars
import 'package:hive_flutter/hive_flutter.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/persistence/cache/handler/handler.dart';
import 'package:likeminds_chat_fl/src/persistence/community/handler/handler.dart';
import 'package:likeminds_chat_fl/src/persistence/user/handler/handler.dart';

/// [LMChatPersistence] is a class that provides methods to interact with the
/// persistence layer of the chat SDK.
class LMChatPersistence {
  late LMChatUserDBHandler userDBHandler;
  late LMChatCacheDBHandler cacheDBHandler;
  late LMChatCommunityDBHandler communityDBHandler;

  static LMChatPersistence? _instance;

  /// [instance] is a getter that returns the singleton instance of the [LMChatPersistence] class.
  static LMChatPersistence get instance => _instance ??= LMChatPersistence._();

  /// [LMChatPersistence] is the private constructor for the [LMChatPersistence] class.
  LMChatPersistence._() {
    userDBHandler = LMChatUserDBHandler(
      userBoxName: 'userBox',
      memberStateBoxName: 'memberStateBox',
    );
    cacheDBHandler = LMChatCacheDBHandler(
      cacheBoxName: 'cacheBox',
    );
    communityDBHandler = LMChatCommunityDBHandler(
      communityBoxName: 'communityBox',
    );
  }

  /// [initiate] is a method that initializes the persistence layer.
  /// It returns a [LMResponse] with a [void] data type.
  /// It should be called before any other method of the [LMChatPersistence] class.
  Future<LMResponse<void>> initiate() async {
    await Hive.initFlutter();
    LMResponse<void> userDBInit = await userDBHandler.initiate();
    LMResponse<void> cacheDBInit = await cacheDBHandler.initiate();
    LMResponse<void> communityDBInit = await communityDBHandler.initiate();

    if (!userDBInit.success) {
      return LMResponse.error(
          errorMessage:
              userDBInit.errorMessage ?? "Error in initiating userDB");
    } else if (!cacheDBInit.success) {
      return LMResponse.error(
          errorMessage:
              cacheDBInit.errorMessage ?? "Error in initiating cacheDB");
    } else if (!communityDBInit.success) {
      return LMResponse.error(
          errorMessage: communityDBInit.errorMessage ??
              "Error in initiating communityDB");
    } else {
      return LMResponse(success: true);
    }
  }

  /// [insertOrUpdateUser] is a method that inserts or updates a user in the box.
  Future<LMResponse<void>> insertOrUpdateUser(User user) {
    return userDBHandler.insertOrUpdateUser(user);
  }

  /// [getUser] is a method that returns the user from the box.
  LMResponse<User> getUser() {
    return userDBHandler.getUser();
  }

  /// [deleteUser] is a method that deletes the user from the box.
  Future<LMResponse<void>> deleteUser() {
    return userDBHandler.deleteUser();
  }

  /// [insertOrUpdateValueInCache] is a method that inserts or updates a value in the cache.
  Future<LMResponse<void>> insertOrUpdateValueInCache(LMChatCache cache) {
    return cacheDBHandler.insertOrUpdateValueInCache(cache);
  }

  /// [deleteCache] is a method that deletes a value from the cache.
  Future<LMResponse<void>> deleteCache(String key) {
    return cacheDBHandler.deleteValueFromCache(key);
  }

  /// [getCache] is a method that gets a value from the cache.
  LMResponse<LMChatCache> getCache(String key) {
    return cacheDBHandler.getValueFromCache(key);
  }

  /// [clearCache] is a method that clears the cache.
  Future<LMResponse<void>> clearCache() {
    return cacheDBHandler.clearCache();
  }

  /// [insertOrUpdateMemberState] is a method that inserts or updates a member state in the box.
  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) {
    return userDBHandler.insertOrUpdateMemberState(memberStateResponse);
  }

  /// [getMemberState] is a method that returns the member state from the box.
  LMResponse<MemberStateResponse> getMemberState() {
    return userDBHandler.getMemberState();
  }

  /// [deleteMemberState] is a method that deletes the member state from the box.
  Future<LMResponse<void>> deleteMemberState() {
    return userDBHandler.deleteMemberState();
  }

  /// [insertOrUpdateCommunity] is a method that inserts or updates a community in the box.
  Future<LMResponse<void>> insertOrUpdateCommunity(Community community) {
    return communityDBHandler.insertOrUpdateCommunity(community);
  }

  /// [getCommunity] is a method that returns the community from the box.
  LMResponse<Community> getCommunity() {
    return communityDBHandler.getCommunity();
  }

  /// [deleteCommunity] is a method that deletes the community from the box.
  Future<LMResponse<void>> deleteCommunity() {
    return communityDBHandler.deleteCommunity();
  }
}
