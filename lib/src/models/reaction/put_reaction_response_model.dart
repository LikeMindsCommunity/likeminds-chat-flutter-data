// import 'package:json_annotation/json_annotation.dart';

// part 'put_reaction_response_model.g.dart';

// class PutReactionResponse {
//   final bool success;
//   final String? errorMessage;

//   PutReactionResponse({
//     required this.success,
//     this.errorMessage,
//   });

//   factory PutReactionResponse.fromEntity(PutReactionResponseEntity entity) {
//     return PutReactionResponse(
//       success: entity.success,
//       errorMessage: entity.errorMessage,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'success': success,
//         'errorMessage': errorMessage,
//       };
// }

// @JsonSerializable()
// class PutReactionResponseEntity {
//   @JsonKey(name: 'success')
//   final bool success;
//   @JsonKey(name: 'error_message')
//   final String? errorMessage;

//   PutReactionResponseEntity({
//     required this.success,
//     this.errorMessage,
//   });

//   factory PutReactionResponseEntity.fromJson(Map<String, dynamic> json) =>
//       _$PutReactionResponseEntityFromJson(json);

//   Map<String, dynamic> toJson() => _$PutReactionResponseEntityToJson(this);
// }
