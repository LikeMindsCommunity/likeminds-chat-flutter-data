// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateUserResponseEntity _$ValidateUserResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ValidateUserResponseEntity(
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      community: json['community'] == null
          ? null
          : CommunityEntity.fromJson(json['community'] as Map<String, dynamic>),
      appAccess: json['app_access'] as bool?,
    );

Map<String, dynamic> _$ValidateUserResponseEntityToJson(
        ValidateUserResponseEntity instance) =>
    <String, dynamic>{
      'user': instance.user,
      'community': instance.community,
      'app_access': instance.appAccess,
    };
