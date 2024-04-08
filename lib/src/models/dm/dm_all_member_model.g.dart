// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dm_all_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DmAllMemberEntity _$DmAllMemberEntityFromJson(Map<String, dynamic> json) =>
    DmAllMemberEntity(
      customTitle: json['custom_title'] as String?,
      id: json['id'] as int?,
      imageUrl: json['image_url'] as String?,
      isDeleted: json['is_deleted'] as bool?,
      isGuest: json['is_guest'] as bool?,
      name: json['name'] as String?,
      questionAnswers: json['question_answers'] as String?,
      sdkClientInfo: json['sdk_client_info'] == null
          ? null
          : SDKClientInfo.fromJson(
              json['sdk_client_info'] as Map<String, dynamic>),
      userUniqueId: json['user_unique_id'] as String?,
      uuid: json['uuid'] as String?,
    );

Map<String, dynamic> _$DmAllMemberEntityToJson(DmAllMemberEntity instance) =>
    <String, dynamic>{
      'custom_title': instance.customTitle,
      'id': instance.id,
      'image_url': instance.imageUrl,
      'is_deleted': instance.isDeleted,
      'is_guest': instance.isGuest,
      'name': instance.name,
      'question_answers': instance.questionAnswers,
      'sdk_client_info': instance.sdkClientInfo,
      'user_unique_id': instance.userUniqueId,
      'uuid': instance.uuid,
    };
