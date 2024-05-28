// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshResponseEntity _$RefreshResponseEntityFromJson(
        Map<String, dynamic> json) =>
    RefreshResponseEntity(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$RefreshResponseEntityToJson(
        RefreshResponseEntity instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
