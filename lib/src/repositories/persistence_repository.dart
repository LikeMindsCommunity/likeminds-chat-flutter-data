import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/services/persistence_service.dart';

class PersistenceRepository {
  final PersistenceService persistenceService;

  PersistenceRepository({required this.persistenceService});

  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return persistenceService.insertOrUpdateUser(user);
  }

  LMResponse<User> getUser() {
    return persistenceService.getUser();
  }

  Future<LMResponse<void>> deleteUser() async {
    return persistenceService.deleteUser();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMChatCache cache) async {
    return persistenceService.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return persistenceService.deleteCache(key);
  }

  LMResponse<LMChatCache> getCache(String key) {
    return persistenceService.getCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return persistenceService.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await persistenceService
        .insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return persistenceService.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() async {
    return await persistenceService.deleteMemberState();
  }

  Future<LMResponse<void>> insertOrUpdateCommunity(Community community) async {
    return persistenceService.insertOrUpdateCommunity(community);
  }

  LMResponse<Community> getCommunity() {
    return persistenceService.getCommunity();
  }

  Future<LMResponse<void>> deleteCommunity() async {
    return await persistenceService.deleteCommunity();
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfigurations(
      List<CommunityConfigurations> communityConfigurations) async {
    return persistenceService
        .insertOrUpdateCommunityConfigurations(communityConfigurations);
  }

  LMResponse<CommunityConfigurations> getCommunityConfiguration(String type) {
    return persistenceService.getCommunityConfiguration(type);
  }

  Future<LMResponse<void>> deleteCommunityConfiguration(String type) async {
    return await persistenceService.deleteCommunityConfiguration(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurations() async {
    return persistenceService.clearCommunityConfigurations();
  }
}
