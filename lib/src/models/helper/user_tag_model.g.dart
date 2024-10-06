// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTagEntity _$UserTagEntityFromJson(Map<String, dynamic> json) =>
    UserTagEntity(
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      customTitle: json['custom_title'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isGuest: json['is_guest'] as bool?,
      userUniqueId: json['user_unique_id'] as String?,
      uuid: json['uuid'] as String?,
      sdkClientInfo: json['sdk_client_info'] == null
          ? null
          : SDKClientInfo.fromJson(
              json['sdk_client_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserTagEntityToJson(UserTagEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'custom_title': instance.customTitle,
      'is_guest': instance.isGuest,
      'user_unique_id': instance.userUniqueId,
      'uuid': instance.uuid,
      'sdk_client_info': instance.sdkClientInfo,
    };
