import 'package:json_annotation/json_annotation.dart';

part 'register_device_response_model.g.dart';

@JsonSerializable()
class RegisterDeviceResponse {
  final bool success;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  RegisterDeviceResponse({
    required this.success,
    this.errorMessage,
  });

  factory RegisterDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDeviceResponseToJson(this);
}
