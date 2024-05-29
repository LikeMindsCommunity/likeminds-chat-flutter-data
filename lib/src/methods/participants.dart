import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/participants_repository.dart';

// ignore: lines_longer_than_80_chars
/// ParticipantsApi class is responsible for handling all the participants related API calls
class ParticipantsApi {
  final ParticipantsRepository participantsRepository;

  ParticipantsApi({required this.participantsRepository});

  Future<LMResponse<GetParticipantsResponse>> getParticipants(
      GetParticipantsRequest request) async {
    return await participantsRepository.getParticipants(request);
  }
}
