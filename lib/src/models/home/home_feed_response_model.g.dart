// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeFeedResponseEntity _$GetHomeFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetHomeFeedResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      myChatRooms: (json['data']['my_chatrooms'] as List<dynamic>?)
          ?.map((e) => MyChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalChatRoomCount: json['data']['total_chatroom_count'] as int?,
      totalUnseenCount: json['data']['total_unseen_count'] as int?,
      totalPages: json['data']['total_pages'] as int?,
      unseenChatRoomCount: json['data']['unseen_chatroom_count'] as int?,
    );

Map<String, dynamic> _$GetHomeFeedResponseEntityToJson(
        GetHomeFeedResponseEntity instance) =>
    <String, dynamic>{
      'my_chatrooms': instance.myChatRooms,
      'total_chatroom_count': instance.totalChatRoomCount,
      'total_unseen_count': instance.totalUnseenCount,
      'total_pages': instance.totalPages,
      'unseen_chatroom_count': instance.unseenChatRoomCount,
    };
