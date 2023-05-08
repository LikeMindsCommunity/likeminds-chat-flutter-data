import 'package:json_annotation/json_annotation.dart';

part 'delete_participant_response_model.g.dart';

class DeleteParticipantResponse {
  final bool success;
  final String? errorMessage;

  DeleteParticipantResponse({
    required this.success,
    this.errorMessage,
  });

  factory DeleteParticipantResponse.fromEntity(
      DeleteParticipantResponseEntity entity) {
    return DeleteParticipantResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
    );
  }

  factory DeleteParticipantResponse.fromJson(Map<String, dynamic> json) {
    return DeleteParticipantResponse(
      success: json["success"],
      errorMessage: json["error_message"],
    );
  }

  DeleteParticipantResponseEntity toEntity() {
    return DeleteParticipantResponseEntity(
      success: success,
      errorMessage: errorMessage,
    );
  }
}

@JsonSerializable()
class DeleteParticipantResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;

  DeleteParticipantResponseEntity({
    required this.success,
    this.errorMessage,
  });

  factory DeleteParticipantResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteParticipantResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeleteParticipantResponseEntityToJson(this);
}
