import 'package:json_annotation/json_annotation.dart';

part 'put_media_response_model.g.dart';

class PutMediaResponse {
  final bool success;
  final String? errorMessage;
  final dynamic data;

  PutMediaResponse({
    required this.success,
    this.errorMessage,
    this.data,
  });

  factory PutMediaResponse.fromEntity(PutMediaResponseEntity entity) {
    return PutMediaResponse(
      success: entity.success,
      errorMessage: entity.errorMessage,
      data: entity.data,
    );
  }

  toEntity() {
    return PutMediaResponseEntity(
      success: success,
      errorMessage: errorMessage,
      data: data,
    );
  }
}

@JsonSerializable()
class PutMediaResponseEntity {
  final bool success;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  final dynamic data;

  PutMediaResponseEntity({
    required this.success,
    this.errorMessage,
    this.data,
    String? errorMesssage,
  });

  factory PutMediaResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PutMediaResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PutMediaResponseEntityToJson(this);
}
