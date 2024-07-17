// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_explore_feed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExploreFeedResponseEntity _$GetExploreFeedResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetExploreFeedResponseEntity(
      chatrooms: (json['chatrooms'] as List<dynamic>?)
          ?.map((e) => ChatRoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      pinnedChatroomCount: (json['pinned_chatrooms_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetExploreFeedResponseEntityToJson(
        GetExploreFeedResponseEntity instance) =>
    <String, dynamic>{
      'chatrooms': instance.chatrooms,
      'pinned_chatrooms_count': instance.pinnedChatroomCount,
    };
