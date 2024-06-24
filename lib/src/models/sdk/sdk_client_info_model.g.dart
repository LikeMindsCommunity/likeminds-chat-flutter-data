// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk_client_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SDKClientInfo _$SDKClientInfoFromJson(Map<String, dynamic> json) =>
    SDKClientInfo(
      community: (json['community'] as num?)?.toInt(),
      user: (json['user'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$SDKClientInfoToJson(SDKClientInfo instance) =>
    <String, dynamic>{
      'community': instance.community,
      'user': instance.user,
      'uuid': instance.uuid,
    };
