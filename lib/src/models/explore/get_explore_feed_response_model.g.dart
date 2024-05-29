// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_explore_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExploreFeedResponseEntity _$GetExploreFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetExploreFeedResponseEntity(
      chatrooms: (json['data']['chatrooms'] as List<dynamic>?)
          ?.map((e) => ChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pinnedChatroomCount: json['data']['pinned_chatrooms_count'] as int?,
    );

Map<String, dynamic> _$GetExploreFeedResponseEntityToJson(
        GetExploreFeedResponseEntity instance) =>
    <String, dynamic>{
      'chatrooms': instance.chatrooms,
      'pinned_chatrooms_count': instance.pinnedChatroomCount,
    };
