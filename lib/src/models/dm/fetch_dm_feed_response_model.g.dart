// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_dm_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchDMFeedResponseEntity _$FetchDMFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    FetchDMFeedResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      dmChatrooms: (json['data']['dm_chatrooms'] as List<dynamic>?)
          ?.map((e) => ChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['data']['total_pages'] as int?,
    );

Map<String, dynamic> _$FetchDMFeedResponseEntityToJson(
        FetchDMFeedResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'dm_chatrooms': instance.dmChatrooms,
      'total_pages': instance.totalPages,
    };
