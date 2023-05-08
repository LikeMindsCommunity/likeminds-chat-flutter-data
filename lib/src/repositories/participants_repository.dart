import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/participants_service.dart';

class ParticipantsRepository {
  final ParticipantsService participantsService;

  ParticipantsRepository({required this.participantsService});

  Future<GetParticipantsResponse> getParticipants(
      GetParticipantsRequest request) async {
    final response = await participantsService.getParticipants(request);
    return GetParticipantsResponse.fromEntity(response);
  }
}
