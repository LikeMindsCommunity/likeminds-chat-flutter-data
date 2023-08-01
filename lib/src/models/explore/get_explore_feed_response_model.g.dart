// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_explore_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExploreFeedResponseEntity _$GetExploreFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetExploreFeedResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      chatrooms: (json['data']['chatrooms'] as List<dynamic>?)
          ?.map((e) => ChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pinnedChatroomCount: json['data']['pinned_chatrooms_count'] as int?,
    );

Map<String, dynamic> _$GetExploreFeedResponseEntityToJson(
        GetExploreFeedResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'chatrooms': instance.chatrooms,
      'pinned_chatrooms_count': instance.pinnedChatroomCount,
    };
