// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initiate_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitiateUserResponseEntity _$InitiateUserResponseEntityFromJson(
        Map<String, dynamic> json) =>
    InitiateUserResponseEntity(
      appAccess: json['app_access'] as bool?,
      initiateUser:
          json['community'] == null ? null : InitiateUserEntity.fromJson(json),
      logoutResponse: json['logout_response'] == null
          ? null
          : LogoutResponseEntity.fromJson(
              json['logout_response'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$InitiateUserResponseEntityToJson(
        InitiateUserResponseEntity instance) =>
    <String, dynamic>{
      'app_access': instance.appAccess,
      'initiate_user': instance.initiateUser,
      'logout_response': instance.logoutResponse,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
