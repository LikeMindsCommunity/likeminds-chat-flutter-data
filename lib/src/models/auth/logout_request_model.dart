import 'package:json_annotation/json_annotation.dart';

part 'logout_request_model.g.dart';

@JsonSerializable()
class LogoutRequest {
  @JsonKey(name: 'device_id')
  final String? deviceId;

  LogoutRequest({
    this.deviceId,
  });

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutRequestToJson(this);
}
