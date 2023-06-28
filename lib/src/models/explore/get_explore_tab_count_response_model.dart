import 'package:json_annotation/json_annotation.dart';

part 'get_explore_tab_count_response_model.g.dart';

class GetExploreTabCountResponse {
  final bool success;
  final String? errorMessage;
  final int? totalChannelCount;
  final int? unseenChannelCount;

  GetExploreTabCountResponse({
    required this.success,
    this.errorMessage,
    this.totalChannelCount,
    this.unseenChannelCount,
  });

  factory GetExploreTabCountResponse.fromEntity(
      GetExploreTabCountResponseEntity entity) {
    return GetExploreTabCountResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      totalChannelCount: entity.totalChannelCount,
      unseenChannelCount: entity.unseenChannelCount,
    );
  }

  GetExploreTabCountResponseEntity toEntity() {
    return GetExploreTabCountResponseEntity(
      success: success,
      errorMessage: errorMessage,
      totalChannelCount: totalChannelCount,
      unseenChannelCount: unseenChannelCount,
    );
  }
}

@JsonSerializable()
class GetExploreTabCountResponseEntity {
  final bool success;
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @JsonKey(name: 'total_channel_count')
  final int? totalChannelCount;
  @JsonKey(name: 'unseen_channel_count')
  final int? unseenChannelCount;

  GetExploreTabCountResponseEntity({
    required this.success,
    this.errorMessage,
    this.totalChannelCount,
    this.unseenChannelCount,
  });

  factory GetExploreTabCountResponseEntity.fromJson(
          Map<String, dynamic> json) =>
      _$GetExploreTabCountResponseEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetExploreTabCountResponseEntityToJson(this);
}
