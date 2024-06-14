import 'package:json_annotation/json_annotation.dart';

part 'chatroom_member_model.g.dart';

class ChatRoomMember {
  final String? customIntroText;
  final String? customTitle;
  final int id;
  final String? imageUrl;
  final bool? isGuest;
  final bool? isOwner;
  final String? memberSince;
  final int? memberSinceEpoch;
  final String name;
  final String? organisationName;
  final String? route;
  final int? state;
  final int? updatedAt;
  final String? userUniqueId;

  ChatRoomMember({
    this.customIntroText,
    this.customTitle,
    required this.id,
    this.imageUrl,
    this.isGuest,
    this.isOwner,
    this.memberSince,
    this.memberSinceEpoch,
    required this.name,
    this.organisationName,
    this.route,
    required this.state,
    this.updatedAt,
    this.userUniqueId,
  });

  factory ChatRoomMember.fromEntity(ChatRoomMemberEntity entity) {
    return ChatRoomMember(
      customIntroText: entity.customIntroText,
      customTitle: entity.customTitle,
      id: entity.id,
      imageUrl: entity.imageUrl,
      isGuest: entity.isGuest,
      isOwner: entity.isOwner,
      memberSince: entity.memberSince,
      memberSinceEpoch: entity.memberSinceEpoch,
      name: entity.name,
      organisationName: entity.organisationName,
      route: entity.route,
      state: entity.state,
      updatedAt: entity.updatedAt,
      userUniqueId: entity.userUniqueId,
    );
  }

  ChatRoomMemberEntity toEntity() {
    return ChatRoomMemberEntity(
      customIntroText: customIntroText,
      customTitle: customTitle,
      id: id,
      imageUrl: imageUrl,
      isGuest: isGuest,
      isOwner: isOwner,
      memberSince: memberSince,
      memberSinceEpoch: memberSinceEpoch,
      name: name,
      organisationName: organisationName,
      route: route,
      state: state,
      updatedAt: updatedAt,
      userUniqueId: userUniqueId,
    );
  }
}

@JsonSerializable()
class ChatRoomMemberEntity {
  @JsonKey(name: 'custom_intro_text')
  final String? customIntroText;
  @JsonKey(name: 'custom_title')
  final String? customTitle;
  final int id;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'is_guest')
  final bool? isGuest;
  @JsonKey(name: 'is_owner')
  final bool? isOwner;
  @JsonKey(name: 'member_since')
  final String? memberSince;
  @JsonKey(name: 'member_since_epoch')
  final int? memberSinceEpoch;
  final String name;
  @JsonKey(name: 'organisation_name')
  final String? organisationName;
  final String? route;
  final int? state;
  @JsonKey(name: 'updated_at')
  final int? updatedAt;
  @JsonKey(name: 'user_unique_id')
  final String? userUniqueId;

  ChatRoomMemberEntity({
    this.customIntroText,
    this.customTitle,
    required this.id,
    this.imageUrl,
    this.isGuest,
    this.isOwner,
    this.memberSince,
    this.memberSinceEpoch,
    required this.name,
    this.organisationName,
    this.route,
    required this.state,
    this.updatedAt,
    this.userUniqueId,
  });

  factory ChatRoomMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomMemberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRoomMemberEntityToJson(this);
}
