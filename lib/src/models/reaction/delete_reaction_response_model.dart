import 'package:json_annotation/json_annotation.dart';

part 'delete_reaction_response_model.g.dart';

class DeleteReactionResponse {
  DeleteReactionResponse({
    this.errorMessage,
    required this.success,
  });

  final String? errorMessage;
  final bool success;

  factory DeleteReactionResponse.fromEntity(
      DeleteReactionResponseEntity entity) {
    return DeleteReactionResponse(
      errorMessage: entity.errorMessage,
      success: entity.success,
    );
  }

  toEntity() {
    return DeleteReactionResponseEntity(
      errorMessage: errorMessage,
      success: success,
    );
  }
}

@JsonSerializable()
class DeleteReactionResponseEntity {
  DeleteReactionResponseEntity({
    this.errorMessage,
    required this.success,
  });

  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final bool success;

  factory DeleteReactionResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteReactionResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteReactionResponseEntityToJson(this);
}
