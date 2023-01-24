import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_groupchat/src/models/auth/initiate_user_model.dart';

part 'initiate_user_response_model.g.dart';

@JsonSerializable()
class InitiateUserResponse {
  bool success;
  Map<String, dynamic>? data;

  @JsonKey(name: 'error_message')
  String? errorMessage;

  bool? appAccess;
  InitiateUser? initiateUser;
  dynamic logoutResponse;

  InitiateUserResponse({
    required this.success,
    this.data,
    this.errorMessage,
  });

  factory InitiateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$InitiateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InitiateUserResponseToJson(this);

  @override
  String toString() =>
      "InitiateUserResponse: {success: $success, data: $data, errorMessage: $errorMessage}";
}
