import 'dart:convert';

import 'package:likeminds_chat_fl/src/models/community/community_configurations_model.dart';
import 'package:likeminds_chat_fl/src/persistence/community_configurations/schema/community_conf_hive.dart';


class LMChatCommunityConfigurationDBInterface {
  static CommunityConfigurations toCommunityConfiguration(
      LMChatCommunityConfigurationDB communityConfigurationDBModel) {
    Map<String, dynamic> value =
        jsonDecode(communityConfigurationDBModel.value!)
            as Map<String, dynamic>;

    return CommunityConfigurations(
      description: communityConfigurationDBModel.description,
      type: communityConfigurationDBModel.type,
      value: value,
    );
  }

  static LMChatCommunityConfigurationDB fromCommunityConfiguration(
      CommunityConfigurations communityConfiguration) {
    return LMChatCommunityConfigurationDB(
      description: communityConfiguration.description,
      type: communityConfiguration.type,
      value: jsonEncode(communityConfiguration.value),
    );
  }
}
