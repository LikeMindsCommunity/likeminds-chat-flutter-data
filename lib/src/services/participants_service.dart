import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/participants/get_participants_request_model.dart';
import 'package:likeminds_chat_fl/src/models/participants/get_participants_response_model.dart';

class ParticipantsService {
  final ApiManager apiManager;

  ParticipantsService({required this.apiManager});

  Future<GetParticipantsResponseEntity> getParticipants(
      GetParticipantsRequest request) async {
    try {
      final response = await apiManager.get(
        apiManager.endPoints.chatroomParticipantsEndpoint,
        queryParameters: request.toJson(),
      );

      return GetParticipantsResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return GetParticipantsResponseEntity(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }
}
