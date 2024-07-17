import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

class PersistenceService {
  LMChatPersistence? chatPersistence;

  PersistenceService() {
    chatPersistence = LMChatPersistence.instance;
  }

  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return await chatPersistence!.insertOrUpdateUser(user);
  }

  LMResponse<User> getUser() {
    return chatPersistence!.getUser();
  }

  Future<LMResponse<void>> deleteUser() async {
    return await chatPersistence!.deleteUser();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMChatCache cache) async {
    return await chatPersistence!.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return await chatPersistence!.deleteCache(key);
  }

  LMResponse<LMChatCache> getCache(String key) {
    return chatPersistence!.getCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return await chatPersistence!.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await chatPersistence!
        .insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return chatPersistence!.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() async {
    return await chatPersistence!.deleteMemberState();
  }

  Future<LMResponse<void>> insertOrUpdateCommunity(Community community) async {
    return await chatPersistence!.insertOrUpdateCommunity(community);
  }

  LMResponse<Community> getCommunity() {
    return chatPersistence!.getCommunity();
  }

  Future<LMResponse<void>> deleteCommunity() async {
    return await chatPersistence!.deleteCommunity();
  }
}
