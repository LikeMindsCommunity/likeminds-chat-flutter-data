import 'package:hive/hive.dart';
import 'package:likeminds_chat_fl/src/persistence/user/schema/user_schema.dart';
part 'community_schema.g.dart';


/// Hive Schema for [CommunitySettingsRights] model
/// This class is used to store [CommunitySettingsRights] data in local DB
/// This class is used by [LMChatCommunitySettingsRightsSchemaAdapter] to generate TypeAdapter
@HiveType(typeId: 21)
class LMChatCommunitySettingsRightsSchema extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int state;
  @HiveField(2)
  String title;
  @HiveField(3)
  String? subtitle;
  @HiveField(4)
  bool isLocked;
  @HiveField(5)
  bool isSelected;

  LMChatCommunitySettingsRightsSchema({
    required this.id,
    required this.state,
    required this.title,
    this.subtitle,
    required this.isLocked,
    required this.isSelected,
  });
}

/// Hive Schema for [Community] model
/// This class is used to store [Community] data in local DB
/// This class is used by [LMChatCommunitySchemaAdapter] to generate TypeAdapter
@HiveType(typeId: 22)
class LMChatCommunitySchema extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? imageUrl;
  @HiveField(3)
  String? purpose;
  @HiveField(4)
  String? about;
  @HiveField(5)
  int? membersCount;
  @HiveField(6)
  bool? isMember;
  @HiveField(7)
  int? pendingMembersCount;
  @HiveField(8)
  int? pendingChatRoomCount;
  @HiveField(9)
  int? openReportsCount;
  @HiveField(10)
  int? chatroomUnseen;
  @HiveField(11)
  int? updatedAt;
  @HiveField(12)
  bool? isAdmin;
  @HiveField(13)
  int? state;
  @HiveField(14)
  int? memberState;
  @HiveField(15)
  String? createdBy;
  @HiveField(16)
  String? managedBy;
  @HiveField(17)
  String? date;
  @HiveField(18)
  int? type;
  @HiveField(19)
  int? subType;
  @HiveField(20)
  int? clickState;
  @HiveField(21)
  int? chatroomCount;
  @HiveField(22)
  List<dynamic>? actions;
  @HiveField(23)
  List<LMChatUserSchema>? newChatRoomUsers;
  @HiveField(24)
  List<LMChatUserSchema>? chatRoomUsers;
  @HiveField(25)
  List<int>? memberRightStates;
  @HiveField(26)
  int? orderTime;
  @HiveField(27)
  List<String>? menu;
  @HiveField(28)
  dynamic leaveCommunity;
  @HiveField(29)
  bool? isPaid;
  @HiveField(30)
  bool? autoApproval;
  @HiveField(31)
  int? gracePeriod;
  @HiveField(32)
  bool? isDiscoverable;
  @HiveField(33)
  String? websiteUrl;
  @HiveField(34)
  bool? referralEnabled;
  @HiveField(35)
  List<LMChatCommunitySettingsRightsSchema>? communitySettingRights;
  @HiveField(36)
  String? likeMindsPlan;
  @HiveField(37)
  bool? isFreemiumCommunity;

  LMChatCommunitySchema({
    required this.id,
    required this.name,
    this.imageUrl,
    this.purpose,
    this.about,
    this.membersCount,
    this.isMember,
    this.pendingMembersCount,
    this.pendingChatRoomCount,
    this.openReportsCount,
    this.chatroomUnseen,
    this.updatedAt,
    this.isAdmin,
    this.state,
    this.memberState,
    this.createdBy,
    this.managedBy,
    this.date,
    this.type,
    this.subType,
    this.clickState,
    this.chatroomCount,
    this.actions,
    this.newChatRoomUsers,
    this.chatRoomUsers,
    this.memberRightStates,
    this.orderTime,
    this.menu,
    this.leaveCommunity,
    this.isPaid,
    this.autoApproval,
    this.gracePeriod,
    this.isDiscoverable,
    this.websiteUrl,
    this.referralEnabled,
    this.communitySettingRights,
    this.likeMindsPlan,
    this.isFreemiumCommunity,
  });
}