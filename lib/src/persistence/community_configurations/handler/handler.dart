import 'package:hive/hive.dart';
import 'package:likeminds_chat_fl/src/models/community/community_configurations_model.dart';
import 'package:likeminds_chat_fl/src/models/lm_response_model.dart';
import 'package:likeminds_chat_fl/src/persistence/community_configurations/schema/community_conf_hive.dart';
import 'package:likeminds_chat_fl/src/persistence/community_configurations/utils/utils.dart';

class LMChatCommunityConfigurationDBHandler {
  final String communityConfigBoxName;
  late Box<LMChatCommunityConfigurationDB> communityConfigBox;

  LMChatCommunityConfigurationDBHandler({required this.communityConfigBoxName});

  Future<LMResponse<void>> initiate() async {
    try {
      final LMChatCommunityConfigurationDBAdapter
          communityConfigurationAdapter =
          LMChatCommunityConfigurationDBAdapter();
      if (!Hive.isAdapterRegistered(communityConfigurationAdapter.typeId)) {
        Hive.registerAdapter(communityConfigurationAdapter);
      }

      communityConfigBox = await Hive.openBox<LMChatCommunityConfigurationDB>(
          communityConfigBoxName,
          compactionStrategy: (a, b) => false);

      if (communityConfigBox.isOpen) {
        return LMResponse(success: true);
      } else {
        return LMResponse(success: false, errorMessage: "Failed to open box");
      }
    } on Exception catch (e) {
      return LMResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> insertOrUpdateCommunityConfigurations(
      List<CommunityConfigurations> communityConfigurations) async {
    try {
      List<LMChatCommunityConfigurationDB> communityConfigurationDBModels =
          communityConfigurations
              .map((e) => LMChatCommunityConfigurationDBInterface
                  .fromCommunityConfiguration(e))
              .toList();

      for (var config in communityConfigurationDBModels) {
        await communityConfigBox.put(config.type, config);
      }

      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  Future<LMResponse<void>> deleteCommunityConfiguration(String type) async {
    try {
      final result = communityConfigBox.get(type);

      if (result == null) {
        return LMResponse<void>(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }
      await communityConfigBox.delete(type);
      return LMResponse<void>(success: true);
    } on Exception catch (e) {
      return LMResponse<void>(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  LMResponse<CommunityConfigurations> getCommunityConfiguration(String type) {
    try {
      final queryResult = communityConfigBox.get(type);

      if (queryResult == null) {
        return LMResponse(
          errorMessage: "Community Configuration not found",
          success: false,
        );
      }

      CommunityConfigurations communityConfiguration =
          LMChatCommunityConfigurationDBInterface.toCommunityConfiguration(
              queryResult);

      return LMResponse(success: true, data: communityConfiguration);
    } on Exception catch (e) {
      return LMResponse(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }

  Future<LMResponse<void>> clearCommunityConfigurations() async {
    try {
      await communityConfigBox.clear();
      return LMResponse(success: true);
    } on Exception catch (e) {
      return LMResponse(
        errorMessage: e.toString(),
        success: false,
      );
    }
  }
}
