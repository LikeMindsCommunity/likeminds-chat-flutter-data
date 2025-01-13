import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/constant/string_constant.dart';
import 'package:likeminds_chat_fl/src/repositories/persistence_repository.dart';

class PersistenceApi {
  final PersistenceRepository persistenceRepository;

  PersistenceApi({required this.persistenceRepository});

  Future<LMResponse<void>> insertOrUpdateUser(User user) async {
    return persistenceRepository.insertOrUpdateUser(user);
  }

  LMResponse<User> getUser() {
    return persistenceRepository.getUser();
  }

  Future<LMResponse<void>> deleteUser() async {
    return persistenceRepository.deleteUser();
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMChatCache cache) async {
    return persistenceRepository.insertOrUpdateValueInCache(cache);
  }

  Future<LMResponse<void>> deleteCache(String key) async {
    return persistenceRepository.deleteCache(key);
  }

  LMResponse<LMChatCache> getCache(String key) {
    return persistenceRepository.getCache(key);
  }

  Future<LMResponse<void>> clearCache() async {
    return persistenceRepository.clearCache();
  }

  Future<LMResponse<void>> insertOrUpdateMemberState(
      MemberStateResponse memberStateResponse) async {
    return await persistenceRepository
        .insertOrUpdateMemberState(memberStateResponse);
  }

  LMResponse<MemberStateResponse> getMemberState() {
    return persistenceRepository.getMemberState();
  }

  Future<LMResponse<void>> deleteMemberState() async {
    return await persistenceRepository.deleteMemberState();
  }

  Future<LMResponse<void>> insertOrUpdateCommunity(Community community) async {
    return persistenceRepository.insertOrUpdateCommunity(community);
  }

  LMResponse<Community> getCommunity() {
    return persistenceRepository.getCommunity();
  }

  Future<LMResponse<void>> deleteCommunity() async {
    return await persistenceRepository.deleteCommunity();
  }

  Future<LMResponse<void>> setChatroomIdWithAIChatbot(int? chatroomId) async {
    final cache = (LMChatCacheBuilder()
          ..key(kChatroomIdWithAIChatbot)
          ..value(chatroomId))
        .build();
    return persistenceRepository.insertOrUpdateValueInCache(cache);
  }

  LMResponse<int?> getChatroomIdWithAIChatbot() {
    final response = persistenceRepository.getCache(kChatroomIdWithAIChatbot);
    if (response.success) {
      return LMResponse.success(data: response.data?.value as int?);
    }
    return LMResponse.success(data: null);
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfigurations(
      List<CommunityConfigurations> communityConfigurations) async {
    return await persistenceRepository
        .insertOrUpdateCommunityConfigurations(communityConfigurations);
  }

  LMResponse<CommunityConfigurations> getCommunityConfiguration(String type) {
    return persistenceRepository.getCommunityConfiguration(type);
  }

  Future<LMResponse<void>> deleteCommunityConfiguration(String type) async {
    return await persistenceRepository.deleteCommunityConfiguration(type);
  }

  Future<LMResponse<void>> clearCommunityConfigurationDB() async {
    return persistenceRepository.clearCommunityConfigurations();
  }
}
