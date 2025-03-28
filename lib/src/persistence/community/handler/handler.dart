import 'package:hive/hive.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/persistence/community/schema/community_schema.dart';
import 'package:likeminds_chat_fl/src/persistence/community/utils/utils.dart';
import 'package:likeminds_chat_fl/src/persistence/user/schema/user_schema.dart';

/// [LMChatCommunityDBHandler] is a class that defines the structure for the community handler.
class LMChatCommunityDBHandler {
  /// [communityBoxName] is the name of the box that stores the community data.
  final String communityBoxName;

  /// [communityBox] is the box that stores the community data.
  late Box<LMChatCommunitySchema> communityBox;

  /// [LMChatCommunityDBHandler] is the constructor for the [LMChatCommunityDBHandler] class.
  LMChatCommunityDBHandler({
    required this.communityBoxName,
  });

  /// [initiate] is a method that initializes the community handler.
  Future<LMResponse<void>> initiate() async {
    try {
      final LMChatUserSchemaAdapter userSchemaAdapter =
          LMChatUserSchemaAdapter();
      final LMChatCommunitySchemaAdapter communitySchemaAdapter =
          LMChatCommunitySchemaAdapter();
      final LMChatCommunitySettingsRightsSchemaAdapter
          communitySettingsRightsSchemaAdapter =
          LMChatCommunitySettingsRightsSchemaAdapter();
          
      // Register adapters
      if (!Hive.isAdapterRegistered(userSchemaAdapter.typeId)) {
        Hive.registerAdapter(userSchemaAdapter);
      }

      if (!Hive.isAdapterRegistered(communitySchemaAdapter.typeId)) {
        Hive.registerAdapter(communitySchemaAdapter);
      }

      if (!Hive.isAdapterRegistered(
          communitySettingsRightsSchemaAdapter.typeId)) {
        Hive.registerAdapter(communitySettingsRightsSchemaAdapter);
      }
      communityBox = await Hive.openBox<LMChatCommunitySchema>(communityBoxName,
          compactionStrategy: (a, b) => false);
      if (communityBox.isOpen) {
        return LMResponse.success(data: null);
      } else {
        return LMResponse.error(errorMessage: 'Failed to open box');
      }
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  /// [insertOrUpdateCommunity] is a method that inserts or updates a community in the box.
  Future<LMResponse<void>> insertOrUpdateCommunity(Community community) async {
    try {
      final communitySchema = community.toCommunitySchema();
      await communityBox.put(communitySchema.id, communitySchema);
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  /// [getCommunity] is a method that gets the community from the box.
  LMResponse<Community> getCommunity() {
    try {
      final communitySchemaList = communityBox.values.toList();
      if (communitySchemaList.isEmpty) {
        return LMResponse.error(errorMessage: 'Community not found');
      }
      return LMResponse.success(data: communitySchemaList.first.toCommunity());
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  /// [deleteCommunity] is a method that deletes the community from the box.
  Future<LMResponse<void>> deleteCommunity() async {
    try {
      await communityBox.clear();
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }
}
