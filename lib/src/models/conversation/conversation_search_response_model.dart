import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class ConversationSearchResponseModel {
  final List<Conversation>? conversations;
  final Map<String, LMWidgetData>? widgets;

  ConversationSearchResponseModel({
    required this.conversations,
    required this.widgets,
  });
}

@JsonSerializable()
class ConversationSearchResponseEntity {
  @JsonKey(name: "conversations")
  List<ConversationEntity>? conversations;
  @JsonKey(name: "widgets")
  final Map<String, LMWidgetDataEntity>? widgets; // check

  ConversationSearchResponseEntity({
    this.conversations,
    this.widgets,
  });
}

// factory ConversationSearchResponseEntity.fromJson(
//         Map<String, dynamic> json) =>
//     _$ConversationSearchResponseEntityFromJson(json);

// Map<String, dynamic> toJson() =>
//     _$ConversationSearchResponseEntityToJson(this);
// }

// @JsonSerializable()
// class Conversation {
//   @JsonKey(name: "answer")
//   String? answer;
//   @JsonKey(name: "attachment_count")
//   int? attachmentCount;
//   @JsonKey(name: "attachments")
//   List<Attachment>? attachments;
//   @JsonKey(name: "attachments_uploaded")
//   bool? attachmentsUploaded;
//   @JsonKey(name: "chatroom")
//   Chatroom? chatroom;
//   @JsonKey(name: "community")
//   Community? community;
//   @JsonKey(name: "created_at")
//   int? createdAt;
//   @JsonKey(name: "id")
//   int? id;
//   @JsonKey(name: "is_deleted")
//   bool? isDeleted;
//   @JsonKey(name: "is_edited")
//   bool? isEdited;
//   @JsonKey(name: "last_updated")
//   int? lastUpdated;
//   @JsonKey(name: "member")
//   Member? member;
//   @JsonKey(name: "state")
//   int? state;

//   Conversation({
//     this.answer,
//     this.attachmentCount,
//     this.attachments,
//     this.attachmentsUploaded,
//     this.chatroom,
//     this.community,
//     this.createdAt,
//     this.id,
//     this.isDeleted,
//     this.isEdited,
//     this.lastUpdated,
//     this.member,
//     this.state,
//   });

//   factory Conversation.fromJson(Map<String, dynamic> json) =>
//       _$ConversationFromJson(json);

//   Map<String, dynamic> toJson() => _$ConversationToJson(this);
// }

// @JsonSerializable()
// class Attachment {
//   @JsonKey(name: "type")
//   String? type;
//   @JsonKey(name: "url")
//   String? url;

//   Attachment({
//     this.type,
//     this.url,
//   });

//   factory Attachment.fromJson(Map<String, dynamic> json) =>
//       _$AttachmentFromJson(json);

//   Map<String, dynamic> toJson() => _$AttachmentToJson(this);
// }

// @JsonSerializable()
// class Chatroom {
//   @JsonKey(name: "attachment_count")
//   int? attachmentCount;
//   @JsonKey(name: "attachments_uploaded")
//   bool? attachmentsUploaded;
//   @JsonKey(name: "audio_count")
//   int? audioCount;
//   @JsonKey(name: "chatroom_image_url")
//   dynamic chatroomImageUrl;
//   @JsonKey(name: "created_at")
//   int? createdAt;
//   @JsonKey(name: "device_id")
//   dynamic deviceId;
//   @JsonKey(name: "header")
//   Header? header;
//   @JsonKey(name: "id")
//   int? id;
//   @JsonKey(name: "image_count")
//   int? imageCount;
//   @JsonKey(name: "is_deleted")
//   bool? isDeleted;
//   @JsonKey(name: "is_pending")
//   bool? isPending;
//   @JsonKey(name: "is_pinned")
//   bool? isPinned;
//   @JsonKey(name: "is_secret")
//   bool? isSecret;
//   @JsonKey(name: "pdf_count")
//   int? pdfCount;
//   @JsonKey(name: "platform")
//   dynamic platform;
//   @JsonKey(name: "title")
//   String? title;
//   @JsonKey(name: "type")
//   int? type;
//   @JsonKey(name: "video_count")
//   int? videoCount;

//   Chatroom({
//     this.attachmentCount,
//     this.attachmentsUploaded,
//     this.audioCount,
//     this.chatroomImageUrl,
//     this.createdAt,
//     this.deviceId,
//     this.header,
//     this.id,
//     this.imageCount,
//     this.isDeleted,
//     this.isPending,
//     this.isPinned,
//     this.isSecret,
//     this.pdfCount,
//     this.platform,
//     this.title,
//     this.type,
//     this.videoCount,
//   });

//   factory Chatroom.fromJson(Map<String, dynamic> json) =>
//       _$ChatroomFromJson(json);

//   Map<String, dynamic> toJson() => _$ChatroomToJson(this);
// }

// enum Header {
//   @JsonValue("General Chat Room")
//   GENERAL_CHAT_ROOM
// }

// @JsonSerializable()
// class Community {
//   @JsonKey(name: "id")
//   int? id;
//   @JsonKey(name: "name")
//   Name? name;

//   Community({
//     this.id,
//     this.name,
//   });

//   factory Community.fromJson(Map<String, dynamic> json) =>
//       _$CommunityFromJson(json);

//   Map<String, dynamic> toJson() => _$CommunityToJson(this);
// }

// enum Name {
//   @JsonValue("DM without consent")
//   DM_WITHOUT_CONSENT
// }

// @JsonSerializable()
// class Member {
//   @JsonKey(name: "id")
//   int? id;
//   @JsonKey(name: "image_url")
//   String? imageUrl;
//   @JsonKey(name: "is_guest")
//   bool? isGuest;
//   @JsonKey(name: "name")
//   String? name;
//   @JsonKey(name: "organisation_name")
//   dynamic organisationName;
//   @JsonKey(name: "profile")
//   Profile? profile;
//   @JsonKey(name: "roles")
//   List<dynamic>? roles;
//   @JsonKey(name: "sdk_client_info")
//   SdkClientInfo? sdkClientInfo;
//   @JsonKey(name: "updated_at")
//   int? updatedAt;
//   @JsonKey(name: "user_unique_id")
//   String? userUniqueId;
//   @JsonKey(name: "uuid")
//   String? uuid;

//   Member({
//     this.id,
//     this.imageUrl,
//     this.isGuest,
//     this.name,
//     this.organisationName,
//     this.profile,
//     this.roles,
//     this.sdkClientInfo,
//     this.updatedAt,
//     this.userUniqueId,
//     this.uuid,
//   });

//   factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

//   Map<String, dynamic> toJson() => _$MemberToJson(this);
// }

// @JsonSerializable()
// class Profile {
//   @JsonKey(name: "name")
//   String? name;

//   Profile({
//     this.name,
//   });

//   factory Profile.fromJson(Map<String, dynamic> json) =>
//       _$ProfileFromJson(json);

//   Map<String, dynamic> toJson() => _$ProfileToJson(this);
// }

// @JsonSerializable()
// class SdkClientInfo {
//   @JsonKey(name: "community")
//   int? community;
//   @JsonKey(name: "user")
//   int? user;
//   @JsonKey(name: "user_unique_id")
//   String? userUniqueId;
//   @JsonKey(name: "uuid")
//   String? uuid;
//   @JsonKey(name: "widget_id")
//   String? widgetId;

//   SdkClientInfo({
//     this.community,
//     this.user,
//     this.userUniqueId,
//     this.uuid,
//     this.widgetId,
//   });

//   factory SdkClientInfo.fromJson(Map<String, dynamic> json) =>
//       _$SdkClientInfoFromJson(json);

//   Map<String, dynamic> toJson() => _$SdkClientInfoToJson(this);
// }

// @JsonSerializable()
// class Widgets {
//   Widgets();

//   factory Widgets.fromJson(Map<String, dynamic> json) =>
//       _$WidgetsFromJson(json);

//   Map<String, dynamic> toJson() => _$WidgetsToJson(this);
// }
