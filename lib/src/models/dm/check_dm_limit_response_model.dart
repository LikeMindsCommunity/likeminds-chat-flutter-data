import 'package:json_annotation/json_annotation.dart';
part 'check_dm_limit_response_model.g.dart';

class CheckDMLimitResponse {
  final bool success;
  final String? errorMessage;
  final int? chatroomId;
  final bool? isRequestDmLimitExceeded;
  final int? newRequestDmTimestamp;

  CheckDMLimitResponse({
    required this.success,
    this.errorMessage,
    this.chatroomId,
    this.isRequestDmLimitExceeded,
    this.newRequestDmTimestamp,
  });

  factory CheckDMLimitResponse.fromEntity(CheckDMLimitResponseEntity entity) {
    return CheckDMLimitResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      chatroomId: entity.chatroomId,
      isRequestDmLimitExceeded: entity.isRequestDmLimitExceeded,
      newRequestDmTimestamp: entity.newRequestDmTimestamp,
    );
  }

  CheckDMLimitResponseEntity toEntity() {
    return CheckDMLimitResponseEntity(
      success: success,
      errorMessage: errorMessage,
      chatroomId: chatroomId,
      isRequestDmLimitExceeded: isRequestDmLimitExceeded,
      newRequestDmTimestamp: newRequestDmTimestamp,
    );
  }
}

@JsonSerializable()
class CheckDMLimitResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'chatroom_id')
  final int? chatroomId;
  @JsonKey(name: 'is_request_dm_limit_exceeded')
  final bool? isRequestDmLimitExceeded;
  @JsonKey(name: 'new_request_dm_timestamp')
  final int? newRequestDmTimestamp;

  CheckDMLimitResponseEntity({
    required this.success,
    this.errorMessage,
    this.chatroomId,
    this.isRequestDmLimitExceeded,
    this.newRequestDmTimestamp,
  });

  factory CheckDMLimitResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckDMLimitResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDMLimitResponseEntityToJson(this);
}
