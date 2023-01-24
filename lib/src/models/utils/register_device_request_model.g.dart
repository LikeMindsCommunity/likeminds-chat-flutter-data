// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDeviceRequest _$RegisterDeviceRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterDeviceRequest(
      token: json['token'] as String,
      deviceId: json['device_id'] as String,
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$RegisterDeviceRequestToJson(
        RegisterDeviceRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'device_id': instance.deviceId,
      'access_token': instance.accessToken,
    };
