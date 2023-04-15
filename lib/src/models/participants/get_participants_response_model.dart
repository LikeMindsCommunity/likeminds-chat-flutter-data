import 'package:json_annotation/json_annotation.dart';

part 'get_participants_response_model.g.dart';

class GetParticipantsResponse {
  final bool success;
  final String? errorMessage;
  final dynamic data;

  GetParticipantsResponse({
    required this.success,
    this.errorMessage,
    this.data,
  });

  factory GetParticipantsResponse.fromEntity(
      GetParticipantsResponseEntity entity) {
    return GetParticipantsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      data: entity.data,
    );
  }

  toEntity() {
    return GetParticipantsResponseEntity(
      success: success,
      data: data,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class GetParticipantsResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final dynamic data;

  GetParticipantsResponseEntity({
    required this.success,
    this.errorMessage,
    this.data,
  });

  factory GetParticipantsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetParticipantsResponseEntityFromJson(json);

  toJson() => _$GetParticipantsResponseEntityToJson(this);
}
