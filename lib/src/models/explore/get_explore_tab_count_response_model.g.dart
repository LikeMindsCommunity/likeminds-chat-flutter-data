// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_explore_tab_count_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExploreTabCountResponseEntity _$GetExploreTabCountResponseEntityFromJson(
        Map<String, dynamic> json) =>
    GetExploreTabCountResponseEntity(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String?,
      totalChannelCount: json['data']['total_channel_count'] as int?,
      unseenChannelCount: json['data']['unseen_channel_count'] as int?,
    );

Map<String, dynamic> _$GetExploreTabCountResponseEntityToJson(
        GetExploreTabCountResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'total_channel_count': instance.totalChannelCount,
      'unseen_channel_count': instance.unseenChannelCount,
    };
