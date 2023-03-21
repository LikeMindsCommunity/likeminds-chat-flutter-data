// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatroom_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomMemberEntity _$ChatRoomMemberEntityFromJson(
        Map<String, dynamic> json) =>
    ChatRoomMemberEntity(
      customIntroText: json['custom_intro_text'] as String?,
      customTitle: json['custom_title'] as String?,
      id: json['id'] as int,
      imageUrl: json['image_url'] as String?,
      isGuest: json['is_guest'] as bool?,
      isOwner: json['is_owner'] as bool?,
      memberSince: json['member_since'] as String?,
      memberSinceEpoch: json['member_since_epoch'] as int?,
      name: json['name'] as String,
      organisationName: json['organisation_name'] as String?,
      route: json['route'] as String?,
      state: json['state'] as int,
      updatedAt: json['updated_at'] as int?,
      userUniqueId: json['user_unique_id'] as String?,
    );

Map<String, dynamic> _$ChatRoomMemberEntityToJson(
        ChatRoomMemberEntity instance) =>
    <String, dynamic>{
      'custom_intro_text': instance.customIntroText,
      'custom_title': instance.customTitle,
      'id': instance.id,
      'image_url': instance.imageUrl,
      'is_guest': instance.isGuest,
      'is_owner': instance.isOwner,
      'member_since': instance.memberSince,
      'member_since_epoch': instance.memberSinceEpoch,
      'name': instance.name,
      'organisation_name': instance.organisationName,
      'route': instance.route,
      'state': instance.state,
      'updated_at': instance.updatedAt,
      'user_unique_id': instance.userUniqueId,
    };
