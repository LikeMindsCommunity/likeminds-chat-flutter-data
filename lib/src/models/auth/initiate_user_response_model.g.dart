// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateUserResponseEntity _$InitiateUserResponseEntityFromJson(
        Map<String, dynamic> json) =>
    InitiateUserResponseEntity(
      appAccess: json['app_access'] as bool?,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      community: json['community'] == null
          ? null
          : CommunityEntity.fromJson(json['community'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$InitiateUserResponseEntityToJson(
        InitiateUserResponseEntity instance) =>
    <String, dynamic>{
      'app_access': instance.appAccess,
      'user': instance.user,
      'community': instance.community,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
