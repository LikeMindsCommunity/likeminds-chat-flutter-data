// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeFeedRequestEntity _$GetHomeFeedRequestEntityFromJson(
        Map<String, dynamic> json) =>
    GetHomeFeedRequestEntity(
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
    );

Map<String, dynamic> _$GetHomeFeedRequestEntityToJson(
        GetHomeFeedRequestEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
    };
