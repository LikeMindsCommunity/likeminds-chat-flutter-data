import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/models/participants/get_participants_request_model.dart';
import 'package:likeminds_chat_fl/src/models/participants/get_participants_response_model.dart';

class ParticipantsService {
  final ApiManager apiManager;

  ParticipantsService({required this.apiManager});

  Future<LMResponse<GetParticipantsResponseEntity>> getParticipants(
      GetParticipantsRequest request) async {
    try {
      final response = await apiManager.client().get(
        apiManager.endPoints.chatroomParticipantsEndpoint,
        queryParameters: request.toJson(),
      );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      return LMResponse.success(
        data: GetParticipantsResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
