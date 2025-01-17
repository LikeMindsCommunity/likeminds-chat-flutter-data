import 'package:json_annotation/json_annotation.dart';
import 'package:likeminds_chat_fl/src/models/community/community_configurations_model.dart';

part 'get_community_configurations_response_model.g.dart';

class GetCommunityConfigurationsResponse {
  final List<CommunityConfigurations> communityConfigurations;

  GetCommunityConfigurationsResponse({
    required this.communityConfigurations,
  });

  factory GetCommunityConfigurationsResponse.fromEntity(
      GetCommunityConfigurationsResponseEntity entity) {
    return GetCommunityConfigurationsResponse(
      communityConfigurations: entity.communityConfigurations
              ?.map((e) => CommunityConfigurations.fromEntity(e))
              .toList() ??
          [],
    );
  }

  GetCommunityConfigurationsResponseEntity toEntity() {
    return GetCommunityConfigurationsResponseEntity(
      communityConfigurations:
          communityConfigurations.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class GetCommunityConfigurationsResponseEntity {
  @JsonKey(name: "community_configurations")
  final List<CommunityConfigurationsEntity>? communityConfigurations;

  GetCommunityConfigurationsResponseEntity({
    this.communityConfigurations,
  });

  factory GetCommunityConfigurationsResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetCommunityConfigurationsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCommunityConfigurationsResponseEntityToJson(this);
}
