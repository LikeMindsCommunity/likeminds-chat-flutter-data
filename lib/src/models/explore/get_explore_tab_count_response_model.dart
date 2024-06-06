import 'package:json_annotation/json_annotation.dart';

part 'get_explore_tab_count_response_model.g.dart';

class GetExploreTabCountResponse {
  final int? totalChannelCount;
  final int? unseenChannelCount;

  GetExploreTabCountResponse({
    this.totalChannelCount,
    this.unseenChannelCount,
  });

  factory GetExploreTabCountResponse.fromEntity(
      GetExploreTabCountResponseEntity entity) {
    return GetExploreTabCountResponse(
      totalChannelCount: entity.totalChannelCount,
      unseenChannelCount: entity.unseenChannelCount,
    );
  }

  GetExploreTabCountResponseEntity toEntity() {
    return GetExploreTabCountResponseEntity(
      totalChannelCount: totalChannelCount,
      unseenChannelCount: unseenChannelCount,
    );
  }
}

@JsonSerializable()
class GetExploreTabCountResponseEntity {
  @JsonKey(name: 'total_channel_count')
  final int? totalChannelCount;
  @JsonKey(name: 'unseen_channel_count')
  final int? unseenChannelCount;

  GetExploreTabCountResponseEntity({
    this.totalChannelCount,
    this.unseenChannelCount,
  });

  factory GetExploreTabCountResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetExploreTabCountResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetExploreTabCountResponseEntityToJson(this);
}
