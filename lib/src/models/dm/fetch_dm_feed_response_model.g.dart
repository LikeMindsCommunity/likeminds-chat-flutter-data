// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_dm_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchDMFeedResponseEntity _$FetchDMFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    FetchDMFeedResponseEntity(
      dmChatRooms: (json['dm_chatrooms'] as List<dynamic>?)
          ?.map((e) => ChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FetchDMFeedResponseEntityToJson(
        FetchDMFeedResponseEntity instance) =>
    <String, dynamic>{
      'dm_chatrooms': instance.dmChatRooms,
      'total_pages': instance.totalPages,
    };
