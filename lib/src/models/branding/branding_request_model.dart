import 'package:json_annotation/json_annotation.dart';

part 'branding_request_model.g.dart';

@JsonSerializable()
class BrandingRequest {
  @JsonKey(name: 'access_token')
  final String accessToken;

  BrandingRequest({
    required this.accessToken,
  });

  factory BrandingRequest.fromJson(Map<String, dynamic> json) =>
      _$BrandingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BrandingRequestToJson(this);
}
