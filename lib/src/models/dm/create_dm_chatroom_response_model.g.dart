// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_dm_chatroom_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDMChatroomResponseEntity _$CreateDMChatroomResponseEntityFromJson(
        Map<String, dynamic> json) =>
    CreateDMChatroomResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      chatRoomEntity: json['data']['chatroom'] == null
          ? null
          : ChatRoomEntity.fromJson(json['data']['chatroom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateDMChatroomResponseEntityToJson(
        CreateDMChatroomResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'chatroom': instance.chatRoomEntity,
    };
