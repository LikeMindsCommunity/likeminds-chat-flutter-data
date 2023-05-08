import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/participants_repository.dart';

class ParticipantsApi {
  final ParticipantsRepository participantsRepository;

  ParticipantsApi({required this.participantsRepository});

  Future<LMResponse<GetParticipantsResponse>> getParticipants(
      GetParticipantsRequest request) async {
    final response = await participantsRepository.getParticipants(request);
    return LMResponse<GetParticipantsResponse>(
      data: response,
      success: response.success,
      errorMessage: response.errorMessage,
    );
  }
}
