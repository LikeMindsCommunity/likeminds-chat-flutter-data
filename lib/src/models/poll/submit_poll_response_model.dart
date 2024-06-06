// class SubmitPollResponse {
//   final bool success;
//   final String? errorMessage;

//   SubmitPollResponse({
//     required this.success,
//     this.errorMessage,
//   });

//   factory SubmitPollResponse.fromEntity(SubmitPollResponseEntity entity) {
//     return SubmitPollResponse(
//       success: entity.success,
//       errorMessage: entity.errorMessage,
//     );
//   }

//   SubmitPollResponseEntity toEntity() {
//     return SubmitPollResponseEntity(
//       success: success,
//       errorMessage: errorMessage,
//     );
//   }
// }

// class SubmitPollResponseEntity {
//   bool success;
//   String? errorMessage;

//   SubmitPollResponseEntity({
//     required this.success,
//     this.errorMessage,
//   });

//   factory SubmitPollResponseEntity.fromJson(Map<String, dynamic> json) {
//     return SubmitPollResponseEntity(
//       success: json['success'],
//       errorMessage: json['error_message'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'error_message': errorMessage,
//     };
//   }
// }
