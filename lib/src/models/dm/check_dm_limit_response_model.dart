import 'package:json_annotation/json_annotation.dart';
part 'check_dm_limit_response_model.g.dart';

class CheckDMLimitResponse {
  final int? chatroomId;
  final bool? isRequestDmLimitExceeded;
  final int? newRequestDmTimestamp;

  CheckDMLimitResponse({
    this.chatroomId,
    this.isRequestDmLimitExceeded,
    this.newRequestDmTimestamp,
  });

  factory CheckDMLimitResponse.fromEntity(CheckDMLimitResponseEntity entity) {
    return CheckDMLimitResponse(

      chatroomId: entity.chatroomId,
      isRequestDmLimitExceeded: entity.isRequestDmLimitExceeded,
      newRequestDmTimestamp: entity.newRequestDmTimestamp,
    );
  }

  CheckDMLimitResponseEntity toEntity() {
    return CheckDMLimitResponseEntity(
      chatroomId: chatroomId,
      isRequestDmLimitExceeded: isRequestDmLimitExceeded,
      newRequestDmTimestamp: newRequestDmTimestamp,
    );
  }
}

@JsonSerializable()
class CheckDMLimitResponseEntity {
  @JsonKey(name: 'chatroom_id')
  final int? chatroomId;
  @JsonKey(name: 'is_request_dm_limit_exceeded')
  final bool? isRequestDmLimitExceeded;
  @JsonKey(name: 'new_request_dm_timestamp')
  final int? newRequestDmTimestamp;

  CheckDMLimitResponseEntity({
    this.chatroomId,
    this.isRequestDmLimitExceeded,
    this.newRequestDmTimestamp,
  });

  factory CheckDMLimitResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckDMLimitResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckDMLimitResponseEntityToJson(this);
}
