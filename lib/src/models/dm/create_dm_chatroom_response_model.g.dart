// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_dm_chatroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDMChatroomResponseEntity _$CreateDMChatroomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CreateDMChatroomResponseEntity(
      chatRoomEntity: json['chatroom'] == null
          ? null
          : ChatRoomEntity.fromJson(json['chatroom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateDMChatroomResponseEntityToJson(
        CreateDMChatroomResponseEntity instance) =>
    <String, dynamic>{
      'chatroom': instance.chatRoomEntity,
    };
