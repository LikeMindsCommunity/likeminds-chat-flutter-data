import 'package:json_annotation/json_annotation.dart';

part 'register_device_request_model.g.dart';

@JsonSerializable()
class RegisterDeviceRequest {
  final String token;

  @JsonKey(name: 'device_id')
  final String deviceId;

  @JsonKey(name: 'access_token')
  final String accessToken;

  RegisterDeviceRequest({
    required this.token,
    required this.deviceId,
    required this.accessToken,
  });

  factory RegisterDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceRequestToJson(this);
}
