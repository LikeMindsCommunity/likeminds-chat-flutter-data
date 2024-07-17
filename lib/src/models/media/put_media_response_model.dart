import 'package:json_annotation/json_annotation.dart';

part 'put_media_response_model.g.dart';

class PutMediaResponse {
  final dynamic data;

  PutMediaResponse({
    this.data,
  });

  factory PutMediaResponse.fromEntity(PutMediaResponseEntity entity) {
    return PutMediaResponse(
      data: entity.data,
    );
  }

  toEntity() {
    return PutMediaResponseEntity(
      data: data,
    );
  }
}

@JsonSerializable()
class PutMediaResponseEntity {
  final dynamic data;

  PutMediaResponseEntity({
    this.data,
    String? errorMesssage,
  });

  factory PutMediaResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PutMediaResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PutMediaResponseEntityToJson(this);
}
