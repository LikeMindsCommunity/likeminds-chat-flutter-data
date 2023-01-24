import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_groupchat/src/models/branding/branding_model.dart';

part 'community_model.g.dart';

@JsonSerializable()
class Community {
  final String id;
  final String name;
  final String? purpose;
  final String? about;
  final Branding? branding;
  final int? state;
  final int pendingMembersCount;
  final String? date;
  final int? type;
  final List<Map<String, dynamic>>? actions;
  final List<String>? menu;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'members_count')
  final int? membersCount;

  @JsonKey(name: 'is_member')
  final bool isMember;

  @JsonKey(name: 'pending_chatroom_count')
  final int pendingChatRoomCount;

  @JsonKey(name: 'open_reports_count')
  final int openReportsCount;

  @JsonKey(name: 'chatroom_unseen')
  final int chatroomUnseen;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'is_admin')
  final bool isAdmin;

  @JsonKey(name: 'member_state')
  final int? memberState;

  @JsonKey(name: 'created_by')
  final String? createdBy;

  @JsonKey(name: 'managed_by')
  final String? managedBy;

  @JsonKey(name: 'sub_type')
  final int? subType;

  @JsonKey(name: 'click_state')
  final int? clickState;

  @JsonKey(name: 'chatroom_count')
  final int? chatroomCount;

  @JsonKey(name: 'new_chatroom_users')
  final List<Map<String, dynamic>>? newChatRoomUsers;

  @JsonKey(name: 'chatroom_users')
  final List<Map<String, dynamic>>? chatRoomUsers;

  @JsonKey(name: 'member_right_states')
  final List<int>? memberRightStates;

  @JsonKey(name: 'order_time')
  final int? orderTime;

  @JsonKey(name: 'leave_community')
  final Map<String, dynamic>? leaveCommunity;

  @JsonKey(name: 'is_paid')
  final bool? isPaid;

  @JsonKey(name: 'auto_approval')
  final bool? autoApproval;

  @JsonKey(name: 'grace_period')
  final int? gracePeriod;

  @JsonKey(name: 'is_discoverable')
  final bool? isDiscoverable;

  @JsonKey(name: 'website_url')
  final String? websiteUrl;

  @JsonKey(name: 'referral_enabled')
  final bool? referralEnabled;

  @JsonKey(name: 'community_setting_rights')
  final List<Map<String, dynamic>>? communitySettingRights;

  @JsonKey(name: 'like_minds_plan')
  final String? likeMindsPlan;

  @JsonKey(name: 'is_freemium_community')
  final bool isFreemiumCommunity;

  Community({
    required this.id,
    required this.name,
    this.purpose,
    this.about,
    this.branding,
    this.state,
    required this.pendingMembersCount,
    this.date,
    this.type,
    this.actions,
    this.menu,
    this.imageUrl,
    this.membersCount,
    required this.isMember,
    required this.pendingChatRoomCount,
    required this.openReportsCount,
    required this.chatroomUnseen,
    this.updatedAt,
    required this.isAdmin,
    this.memberState,
    this.createdBy,
    this.managedBy,
    this.subType,
    this.clickState,
    this.chatroomCount,
    this.newChatRoomUsers,
    this.chatRoomUsers,
    this.memberRightStates,
    this.orderTime,
    this.leaveCommunity,
    this.isPaid,
    this.autoApproval,
    this.gracePeriod,
    this.isDiscoverable,
    this.websiteUrl,
    this.referralEnabled,
    this.communitySettingRights,
    this.likeMindsPlan,
    required this.isFreemiumCommunity,
  });

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityToJson(this);
}
