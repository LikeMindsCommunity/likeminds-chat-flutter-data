import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/models/sdk/sdk_client_info_model.dart';
import 'package:likeminds_chat_fl/src/persistence/user/schema/user_schema.dart';

extension LMChatUserSchemaExtension on LMChatUserSchema {
  User toUser() {
    return User(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isGuest: isGuest,
      userUniqueId: uuid,
      sdkClientInfo: sdkClientInfo?.toSDKClientInfo(),
      communityId: communityId,
      createdAt: createdAt,
      isOwner: isOwner,
      customTitle: customTitle,
      memberSince: memberSince,
      route: route,
      state: state,
      updatedAt: updatedAt,
      organisationName: organisationName,
    );
  }
}

extension LMChatUserExtension on User {
  LMChatUserSchema toUserSchema() {
    return LMChatUserSchema(
      id: id,
      name: name,
      uuid: userUniqueId,
      communityId: communityId,
      createdAt: createdAt,
      imageUrl: imageUrl,
      isGuest: isGuest,
      isOwner: isOwner,
      memberSince: memberSince,
      organisationName: organisationName,
      route: route,
      sdkClientInfo: sdkClientInfo?.fromSDKClientInfo(),
      state: state,
      updatedAt: updatedAt,
      customTitle: customTitle,
    );
  }
}

extension LMChatSDKClientInfoSchemaExtension on LMChatSDKClientInfoSchema {
  SDKClientInfo toSDKClientInfo() {
    return SDKClientInfo(
      community: community,
      user: user,
      uuid: uuid,
    );
  }
}

extension LMChatSDKClientInfoExtension on SDKClientInfo {
  LMChatSDKClientInfoSchema fromSDKClientInfo() {
    return LMChatSDKClientInfoSchema(
      community: community!,
      user: user!,
      uuid: uuid!,
    );
  }
}

extension LMChatMemberStateExtension on MemberStateResponse {
  LMChatMemberStateSchema toMemberStateSchema() {
    return LMChatMemberStateSchema(
      uuid: member?.userUniqueId ?? "",
      editRequired: editRequired ?? false,
      member: member?.toUserSchema(),
      memberRights:
          memberRights?.map((e) => e.toMemberRightSchema()).toList() ?? [],
      state: state ?? 0,
    );
  }
}

extension LMChatMemberRightExtension on MemberRight {
  LMChatMemberRightSchema toMemberRightSchema() {
    return LMChatMemberRightSchema(
      id: id,
      isSelected: isSelected,
      state: state,
      title: title,
    );
  }
}

extension LMChatMemberStateSchemaExtension on LMChatMemberStateSchema {
  MemberStateResponse toMemberState() {
    return MemberStateResponse(
      editRequired: editRequired,
      member: member?.toUser(),
      memberRights: memberRights.map((e) => e.toMemberRight()).toList(),
      state: state,
    );
  }
}

extension LMChatMemberRightSchemaExtension on LMChatMemberRightSchema {
  MemberRight toMemberRight() {
    return MemberRight(
      id: id,
      isSelected: isSelected,
      state: state,
      title: title,
    );
  }
}
