import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'get_participants_response_model.g.dart';

class GetParticipantsResponse {
  final bool success;
  final String? errorMessage;
  final bool? canEditParticipant;
  final List<User>? participants;

  GetParticipantsResponse({
    required this.success,
    this.errorMessage,
    this.canEditParticipant,
    this.participants,
  });

  factory GetParticipantsResponse.fromEntity(
      GetParticipantsResponseEntity entity) {
    return GetParticipantsResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      canEditParticipant: entity.canEditParticipant,
      participants: entity.participants
          ?.map((userEntity) => User.fromEntity(userEntity))
          .toList(),
    );
  }

  toEntity() {
    return GetParticipantsResponseEntity(
      success: success,
      errorMessage: errorMessage,
      canEditParticipant: canEditParticipant,
      participants: participants?.map((user) => user.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetParticipantsResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final bool? canEditParticipant;
  final List<UserEntity>? participants;

  GetParticipantsResponseEntity({
    required this.success,
    this.errorMessage,
    this.canEditParticipant,
    this.participants,
  });

  factory GetParticipantsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetParticipantsResponseEntityFromJson(json);

  toJson() => _$GetParticipantsResponseEntityToJson(this);
}
