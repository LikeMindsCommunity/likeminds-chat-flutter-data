import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/community/schema/community_schema.dart';
import 'package:likeminds_chat_fl/src/persistence/user/utils/utils.dart';

/// Extension on [CommunitySettingsRights] to convert it to a [LMChatCommunitySettingsRightsSchema] object
extension CommunitySettingsRightsToSchema on CommunitySettingsRights {
  LMChatCommunitySettingsRightsSchema toCommunitySettingsRightsSchema() {
    return LMChatCommunitySettingsRightsSchema(
      id: id,
      state: state,
      title: title,
      subtitle: subtitle,
      isLocked: isLocked,
      isSelected: isSelected,
    );
  }
}

// ignore: lines_longer_than_80_chars
/// Extension on [LMChatCommunitySettingsRightsSchema] to convert it to a [CommunitySettingsRights] object
extension CommunitySettingsRightsFromSchema
    on LMChatCommunitySettingsRightsSchema {
  CommunitySettingsRights toCommunitySettingsRights() {
    return CommunitySettingsRights(
      id: id,
      state: state,
      title: title,
      subtitle: subtitle,
      isLocked: isLocked,
      isSelected: isSelected,
    );
  }
}

/// Extension on [LMChatCommunitySchema] to convert it to a [Community] object
extension CommunityFromSchema on LMChatCommunitySchema {
  Community toCommunity() {
    return Community(
      id: id,
      name: name,
      imageUrl: imageUrl,
      purpose: purpose,
      about: about,
      membersCount: membersCount,
      isMember: isMember,
      pendingMembersCount: pendingMembersCount,
      pendingChatRoomCount: pendingChatRoomCount,
      openReportsCount: openReportsCount,
      chatroomUnseen: chatroomUnseen,
      updatedAt: updatedAt,
      isAdmin: isAdmin,
      state: state,
      memberState: memberState,
      createdBy: createdBy,
      managedBy: managedBy,
      date: date,
      type: type,
      subType: subType,
      clickState: clickState,
      chatroomCount: chatroomCount,
      actions: actions,
      newChatRoomUsers: newChatRoomUsers?.map((e) => e.toUser()).toList(),
      chatRoomUsers: chatRoomUsers?.map((e) => e.toUser()).toList(),
      memberRightStates: memberRightStates,
      orderTime: orderTime,
      menu: menu,
      leaveCommunity: leaveCommunity,
      isPaid: isPaid,
      autoApproval: autoApproval,
      gracePeriod: gracePeriod,
      isDiscoverable: isDiscoverable,
      websiteUrl: websiteUrl,
      referralEnabled: referralEnabled,
      communitySettingRights: communitySettingRights
          ?.map((e) => e.toCommunitySettingsRights())
          .toList(),
      likeMindsPlan: likeMindsPlan,
      isFreemiumCommunity: isFreemiumCommunity,
    );
  }
}

/// Extension on [Community] to convert it to a [LMChatCommunitySchema] object
extension CommunityToSchema on Community {
  LMChatCommunitySchema toCommunitySchema() {
    return LMChatCommunitySchema(
      id: id,
      name: name,
      imageUrl: imageUrl,
      purpose: purpose,
      about: about,
      membersCount: membersCount,
      isMember: isMember,
      pendingMembersCount: pendingMembersCount,
      pendingChatRoomCount: pendingChatRoomCount,
      openReportsCount: openReportsCount,
      chatroomUnseen: chatroomUnseen,
      updatedAt: updatedAt,
      isAdmin: isAdmin,
      state: state,
      memberState: memberState,
      createdBy: createdBy,
      managedBy: managedBy,
      date: date,
      type: type,
      subType: subType,
      clickState: clickState,
      chatroomCount: chatroomCount,
      actions: actions,
      newChatRoomUsers: newChatRoomUsers?.map((e) => e.toUserSchema()).toList(),
      chatRoomUsers: chatRoomUsers?.map((e) => e.toUserSchema()).toList(),
      memberRightStates: memberRightStates,
      orderTime: orderTime,
      menu: menu,
      leaveCommunity: leaveCommunity,
      isPaid: isPaid,
      autoApproval: autoApproval,
      gracePeriod: gracePeriod,
      isDiscoverable: isDiscoverable,
      websiteUrl: websiteUrl,
      referralEnabled: referralEnabled,
      communitySettingRights: communitySettingRights
          ?.map((e) => e.toCommunitySettingsRightsSchema())
          .toList(),
      likeMindsPlan: likeMindsPlan,
      isFreemiumCommunity: isFreemiumCommunity,
    );
  }
}
