// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LMChatCommunitySettingsRightsSchemaAdapter
    extends TypeAdapter<LMChatCommunitySettingsRightsSchema> {
  @override
  final int typeId = 121;

  @override
  LMChatCommunitySettingsRightsSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMChatCommunitySettingsRightsSchema(
      id: fields[0] as int,
      state: fields[1] as int,
      title: fields[2] as String,
      subtitle: fields[3] as String?,
      isLocked: fields[4] as bool,
      isSelected: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LMChatCommunitySettingsRightsSchema obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.state)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.subtitle)
      ..writeByte(4)
      ..write(obj.isLocked)
      ..writeByte(5)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMChatCommunitySettingsRightsSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LMChatCommunitySchemaAdapter extends TypeAdapter<LMChatCommunitySchema> {
  @override
  final int typeId = 122;

  @override
  LMChatCommunitySchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMChatCommunitySchema(
      id: fields[0] as int,
      name: fields[1] as String,
      imageUrl: fields[2] as String?,
      purpose: fields[3] as String?,
      about: fields[4] as String?,
      membersCount: fields[5] as int?,
      isMember: fields[6] as bool?,
      pendingMembersCount: fields[7] as int?,
      pendingChatRoomCount: fields[8] as int?,
      openReportsCount: fields[9] as int?,
      chatroomUnseen: fields[10] as int?,
      updatedAt: fields[11] as int?,
      isAdmin: fields[12] as bool?,
      state: fields[13] as int?,
      memberState: fields[14] as int?,
      createdBy: fields[15] as String?,
      managedBy: fields[16] as String?,
      date: fields[17] as String?,
      type: fields[18] as int?,
      subType: fields[19] as int?,
      clickState: fields[20] as int?,
      chatroomCount: fields[21] as int?,
      actions: (fields[22] as List?)?.cast<dynamic>(),
      newChatRoomUsers: (fields[23] as List?)?.cast<LMChatUserSchema>(),
      chatRoomUsers: (fields[24] as List?)?.cast<LMChatUserSchema>(),
      memberRightStates: (fields[25] as List?)?.cast<int>(),
      orderTime: fields[26] as int?,
      menu: (fields[27] as List?)?.cast<String>(),
      leaveCommunity: fields[28] as dynamic,
      isPaid: fields[29] as bool?,
      autoApproval: fields[30] as bool?,
      gracePeriod: fields[31] as int?,
      isDiscoverable: fields[32] as bool?,
      websiteUrl: fields[33] as String?,
      referralEnabled: fields[34] as bool?,
      communitySettingRights:
          (fields[35] as List?)?.cast<LMChatCommunitySettingsRightsSchema>(),
      likeMindsPlan: fields[36] as String?,
      isFreemiumCommunity: fields[37] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, LMChatCommunitySchema obj) {
    writer
      ..writeByte(38)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.purpose)
      ..writeByte(4)
      ..write(obj.about)
      ..writeByte(5)
      ..write(obj.membersCount)
      ..writeByte(6)
      ..write(obj.isMember)
      ..writeByte(7)
      ..write(obj.pendingMembersCount)
      ..writeByte(8)
      ..write(obj.pendingChatRoomCount)
      ..writeByte(9)
      ..write(obj.openReportsCount)
      ..writeByte(10)
      ..write(obj.chatroomUnseen)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.isAdmin)
      ..writeByte(13)
      ..write(obj.state)
      ..writeByte(14)
      ..write(obj.memberState)
      ..writeByte(15)
      ..write(obj.createdBy)
      ..writeByte(16)
      ..write(obj.managedBy)
      ..writeByte(17)
      ..write(obj.date)
      ..writeByte(18)
      ..write(obj.type)
      ..writeByte(19)
      ..write(obj.subType)
      ..writeByte(20)
      ..write(obj.clickState)
      ..writeByte(21)
      ..write(obj.chatroomCount)
      ..writeByte(22)
      ..write(obj.actions)
      ..writeByte(23)
      ..write(obj.newChatRoomUsers)
      ..writeByte(24)
      ..write(obj.chatRoomUsers)
      ..writeByte(25)
      ..write(obj.memberRightStates)
      ..writeByte(26)
      ..write(obj.orderTime)
      ..writeByte(27)
      ..write(obj.menu)
      ..writeByte(28)
      ..write(obj.leaveCommunity)
      ..writeByte(29)
      ..write(obj.isPaid)
      ..writeByte(30)
      ..write(obj.autoApproval)
      ..writeByte(31)
      ..write(obj.gracePeriod)
      ..writeByte(32)
      ..write(obj.isDiscoverable)
      ..writeByte(33)
      ..write(obj.websiteUrl)
      ..writeByte(34)
      ..write(obj.referralEnabled)
      ..writeByte(35)
      ..write(obj.communitySettingRights)
      ..writeByte(36)
      ..write(obj.likeMindsPlan)
      ..writeByte(37)
      ..write(obj.isFreemiumCommunity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMChatCommunitySchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
