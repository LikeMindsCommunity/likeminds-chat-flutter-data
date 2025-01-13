// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_community_configurations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommunityConfigurationsResponseEntity
    _$GetCommunityConfigurationsResponseEntityFromJson(
            Map<String, dynamic> json) =>
        GetCommunityConfigurationsResponseEntity(
          communityConfigurations:
              (json['community_configurations'] as List<dynamic>?)
                  ?.map((e) => CommunityConfigurationsEntity.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
        );

Map<String, dynamic> _$GetCommunityConfigurationsResponseEntityToJson(
        GetCommunityConfigurationsResponseEntity instance) =>
    <String, dynamic>{
      'community_configurations':
          instance.communityConfigurations?.map((e) => e.toJson()).toList(),
    };
