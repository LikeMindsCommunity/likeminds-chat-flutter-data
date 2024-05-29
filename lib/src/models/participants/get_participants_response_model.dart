import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

part 'get_participants_response_model.g.dart';

class GetParticipantsResponse {
  final bool? canEditParticipant;
  final List<User>? participants;

  GetParticipantsResponse({
    this.canEditParticipant,
    this.participants,
  });

  factory GetParticipantsResponse.fromEntity(
      GetParticipantsResponseEntity entity) {
    return GetParticipantsResponse(
      canEditParticipant: entity.canEditParticipant,
      participants: entity.participants
          ?.map((userEntity) => User.fromEntity(userEntity))
          .toList(),
    );
  }

  toEntity() {
    return GetParticipantsResponseEntity(
      canEditParticipant: canEditParticipant,
      participants: participants?.map((user) => user.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetParticipantsResponseEntity {
  final bool? canEditParticipant;
  final List<UserEntity>? participants;

  GetParticipantsResponseEntity({
    this.canEditParticipant,
    this.participants,
  });

  factory GetParticipantsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetParticipantsResponseEntityFromJson(json);

  toJson() => _$GetParticipantsResponseEntityToJson(this);
}
