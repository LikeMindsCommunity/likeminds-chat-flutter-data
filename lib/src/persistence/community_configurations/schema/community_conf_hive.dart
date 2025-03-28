import 'package:hive/hive.dart';

part 'community_conf_hive.g.dart';

@HiveType(typeId: 120)
class LMChatCommunityConfigurationDB extends HiveObject {
  @HiveField(0)
  String? description;

  @HiveField(1)
  String? type;

  @HiveField(2)
  String? value;

  LMChatCommunityConfigurationDB({
    this.description,
    this.type,
    this.value,
  });
}
