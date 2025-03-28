import 'package:hive/hive.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/cache/schema/cache_schema.dart';
import 'package:likeminds_chat_fl/src/persistence/cache/utils/utils.dart';

class LMChatCacheDBHandler {
  final String cacheBoxName;
  late Box<LMChatCacheSchema> cacheBox;

  LMChatCacheDBHandler({required this.cacheBoxName});

  Future<LMResponse<void>> initiate() async {
    try {
      final LMChatCacheSchemaAdapter cacheSchemaAdapter =
          LMChatCacheSchemaAdapter();
      if (!Hive.isAdapterRegistered(cacheSchemaAdapter.typeId)) {
        Hive.registerAdapter(cacheSchemaAdapter);
      }

      cacheBox = await Hive.openBox<LMChatCacheSchema>(cacheBoxName,
          compactionStrategy: (a, b) => false);

      if (cacheBox.isOpen) {
        return LMResponse.success(data: null);
      } else {
        return LMResponse.error(errorMessage: 'Failed to open box');
      }
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> insertOrUpdateValueInCache(LMChatCache cache) async {
    try {
      final cacheSchema = cache.toChatCacheSchema();
      await cacheBox.put(cacheSchema.key, cacheSchema);
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> deleteValueFromCache(String key) async {
    try {
      await cacheBox.delete(key);
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  LMResponse<LMChatCache> getValueFromCache(String key) {
    try {
      final cacheHiveModel = cacheBox.get(key);

      if (cacheHiveModel == null) {
        return LMResponse.error(errorMessage: 'Cache not found');
      }

      final cache = cacheHiveModel.toChatCache();
      return LMResponse.success(data: cache);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> clearCache() async {
    try {
      await cacheBox.clear();
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  Future<LMResponse<void>> dispose() async {
    try {
      await cacheBox.close();
      return LMResponse.success(data: null);
    } on Exception catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }
}
