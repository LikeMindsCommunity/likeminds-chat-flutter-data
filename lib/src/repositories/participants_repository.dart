import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/participants_service.dart';

class ParticipantsRepository {
  final ParticipantsService participantsService;

  ParticipantsRepository({required this.participantsService});

  Future<LMResponse<GetParticipantsResponse>> getParticipants(
      GetParticipantsRequest request) async {
    final response = await participantsService.getParticipants(request);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: GetParticipantsResponse.fromEntity(response.data!),
    );
  }
}
