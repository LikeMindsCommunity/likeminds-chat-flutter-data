// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_participants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetParticipantsResponseEntity _$GetParticipantsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetParticipantsResponseEntity(
      canEditParticipant: json['can_edit_participant'] as bool?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetParticipantsResponseEntityToJson(
        GetParticipantsResponseEntity instance) =>
    <String, dynamic>{
      'canEditParticipant': instance.canEditParticipant,
      'participants': instance.participants,
    };
