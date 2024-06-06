// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateUserResponseEntity _$InitiateUserResponseEntityFromJson(
        Map<String, dynamic> json) =>
    InitiateUserResponseEntity(
      appAccess: json['app_access'] as bool?,
      initiateUser: json['user'] == null
          ? null
          : InitiateUserEntity.fromJson(
              json),
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$InitiateUserResponseEntityToJson(
        InitiateUserResponseEntity instance) =>
    <String, dynamic>{
      'app_access': instance.appAccess,
      'initiate_user': instance.initiateUser,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
