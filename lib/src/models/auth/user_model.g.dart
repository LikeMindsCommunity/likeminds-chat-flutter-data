// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      isGuest: json['is_guest'] as bool?,
      userUniqueId: json['user_unique_id'] as String?,
      organisationName: json['organisation_name'] as String?,
      sdkClientInfo: json['sdk_client_info'] == null
          ? null
          : SDKClientInfo.fromJson(
              json['sdk_client_info'] as Map<String, dynamic>),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      isOwner: json['is_owner'] as bool?,
      customTitle: json['custom_title'] as String?,
      memberSince: json['member_since'] as String?,
      route: json['route'] as String?,
      state: (json['state'] as num?)?.toInt(),
      communityId: (json['community_id'] as num?)?.toInt(),
      createdAt: (json['created_at'] as num?)?.toInt(),
      customIntroText: json['custom_intro_text'] as String?,
      memberSinceEpoch: (json['member_since_epoch'] as num?)?.toInt(),
      roles: (json['roles'] as List<dynamic>?)?.map((e) {
        switch (e.toString().toLowerCase()) {
          case 'chatbot':
            return UserRole.chatbot;
          case 'member':
            return UserRole.member;
          case 'admin':
            return UserRole.admin;
          default:
            return UserRole.member;
        }
      }).toList(),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'is_guest': instance.isGuest,
      'user_unique_id': instance.userUniqueId,
      'organisation_name': instance.organisationName,
      'sdk_client_info': instance.sdkClientInfo,
      'updated_at': instance.updatedAt,
      'is_owner': instance.isOwner,
      'custom_title': instance.customTitle,
      'member_since': instance.memberSince,
      'route': instance.route,
      'state': instance.state,
      'community_id': instance.communityId,
      'created_at': instance.createdAt,
      'custom_intro_text': instance.customIntroText,
      'member_since_epoch': instance.memberSinceEpoch,
      'roles': instance.roles,
    };
