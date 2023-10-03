import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class GetPollUsersResponse {
  bool success;
  String? errorMessage;
  List<User>? data;

  GetPollUsersResponse({
    required this.success,
    required this.data,
  });

  factory GetPollUsersResponse.fromEntity(GetPollUsersResponseEntity entity) {
    return GetPollUsersResponse(
      success: entity.success,
      data: entity.data?.map((e) => User.fromEntity(e)).toList(),
    );
  }

  GetPollUsersResponseEntity toEntity() {
    return GetPollUsersResponseEntity(
      success: success,
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }
}

class GetPollUsersResponseEntity {
  bool success;
  List<UserEntity>? data;
  String? errorMessage;

  GetPollUsersResponseEntity({
    required this.success,
    this.data,
    this.errorMessage,
  });

  factory GetPollUsersResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetPollUsersResponseEntity(
      success: json['success'],
      data: (json['data']['members'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['error_message'],
    );
  }
}
