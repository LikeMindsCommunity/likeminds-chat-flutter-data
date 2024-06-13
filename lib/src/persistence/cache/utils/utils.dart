import 'dart:convert';

import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/cache/schema/cache_schema.dart';

extension LMChatCacheSchemaExtension on LMChatCacheSchema {
  LMChatCache toChatCache() {
    dynamic value = jsonDecode(this.value);

    return (LMChatCacheBuilder()
          ..key(key)
          ..value(value))
        .build();
  }
}

extension LMChatCacheExtension on LMChatCache {
  LMChatCacheSchema toChatCacheSchema() {
    return LMChatCacheSchema(
      key: key,
      value: jsonEncode(value),
    );
  }
}
