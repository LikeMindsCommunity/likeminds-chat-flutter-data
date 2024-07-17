import 'package:json_annotation/json_annotation.dart';
import 'og_tags_model.dart';

part 'decode_url_response_model.g.dart';

class DecodeUrlResponse {
  final OgTags? ogTags;

  DecodeUrlResponse({
    this.ogTags,
  });

  factory DecodeUrlResponse.fromEntity(DecodeUrlResponseEntity entity) {
    return DecodeUrlResponse(
      ogTags: entity.ogTags != null ? OgTags.fromEntity(entity.ogTags!) : null,
    );
  }

  DecodeUrlResponseEntity toEntity() {
    return DecodeUrlResponseEntity(
      ogTags: ogTags?.toEntity(),
    );
  }
}

@JsonSerializable()
class DecodeUrlResponseEntity {
  @JsonKey(name: 'og_tags')
  final OgTagsEntity? ogTags;

  DecodeUrlResponseEntity({
    this.ogTags,
  });

  factory DecodeUrlResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DecodeUrlResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DecodeUrlResponseEntityToJson(this);
}
