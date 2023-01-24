import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_groupchat/src/models/branding/branding_model.dart';

part 'branding_response_model.g.dart';

@JsonSerializable()
class BrandingResponse {
  final bool success;

  @JsonKey(name: 'branding')
  final Branding? branding;

  @JsonKey(name: 'error_message')
  final String? errorMessage;

  BrandingResponse({
    required this.success,
    this.branding,
    this.errorMessage,
  });

  factory BrandingResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BrandingResponseToJson(this);

  @override
  String toString() =>
      "BrandingResponse: {success: $success, branding: ${branding.toString()}, errorMessage: $errorMessage}";
}
