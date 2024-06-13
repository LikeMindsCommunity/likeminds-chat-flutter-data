import 'package:hive/hive.dart';

part 'cache_schema.g.dart';

@HiveType(typeId: 10)
class LMChatCacheSchema extends HiveObject {
  @override
  @HiveField(0)
  String key;

  @HiveField(1)
  String value;

  LMChatCacheSchema({
    required this.key,
    required this.value,
  });
}
