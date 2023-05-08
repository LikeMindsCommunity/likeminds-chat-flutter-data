import 'package:json_annotation/json_annotation.dart';

part 'home_feed_request_model.g.dart';

class GetHomeFeedRequest {
  final int? page;
  final int? pageSize;

  GetHomeFeedRequest({
    this.page,
    this.pageSize,
  });

  factory GetHomeFeedRequest.fromEntity(GetHomeFeedRequestEntity entity) {
    return GetHomeFeedRequest(
      page: entity.page,
      pageSize: entity.pageSize,
    );
  }

  toEntity() {
    return GetHomeFeedRequestEntity(
      page: page,
      pageSize: pageSize,
    );
  }
}

@JsonSerializable()
class GetHomeFeedRequestEntity {
  final int? page;
  @JsonKey(name: 'page_size')
  final int? pageSize;

  GetHomeFeedRequestEntity({
    this.page,
    this.pageSize,
  });

  factory GetHomeFeedRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$GetHomeFeedRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeFeedRequestEntityToJson(this);
}
