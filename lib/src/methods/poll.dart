import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/poll_repository.dart';

class PollApi {
  final PollRepository pollRepository;

  PollApi({required this.pollRepository});

  Future<LMResponse<void>> submitPoll(SubmitPollRequest request) async {
    return await pollRepository.submitPoll(request);
  }

  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest request) async {
    return await pollRepository.addPollOption(request);
  }

  Future<LMResponse<GetPollUsersResponse>> getPollUsers(
      GetPollUsersRequest request) async {
    return await pollRepository.getPollUsers(request);
  }

  Future<LMResponse<PostConversationResponse>> postPollConversation(
      PostPollConversationRequest request) async {
    return await pollRepository.postPollConversation(request);
  }
}
