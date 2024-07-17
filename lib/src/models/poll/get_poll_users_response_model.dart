import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

class GetPollUsersResponse {
  List<User>? data;

  GetPollUsersResponse({
    required this.data,
  });

  factory GetPollUsersResponse.fromEntity(GetPollUsersResponseEntity entity) {
    return GetPollUsersResponse(
      data: entity.data?.map((e) => User.fromEntity(e)).toList(),
    );
  }

  GetPollUsersResponseEntity toEntity() {
    return GetPollUsersResponseEntity(
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }
}

class GetPollUsersResponseEntity {
  List<UserEntity>? data;

  GetPollUsersResponseEntity({
    this.data,
  });

  factory GetPollUsersResponseEntity.fromJson(Map<String, dynamic> json) {
    return GetPollUsersResponseEntity(
      data: (json['members'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
