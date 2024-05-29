// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_participants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetParticipantsResponseEntity _$GetParticipantsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetParticipantsResponseEntity(
      canEditParticipant: json['data']['can_edit_participant'] as bool?,
      participants: (json['data']['participants'] as List<dynamic>?)
          ?.map(
            (e) => UserEntity.fromJson(e),
          )
          .toList(),
    );

Map<String, dynamic> _$GetParticipantsResponseEntityToJson(
        GetParticipantsResponseEntity instance) =>
    <String, dynamic>{
      'can_edit_participant': instance.canEditParticipant,
      'participants': instance.participants,
    };
