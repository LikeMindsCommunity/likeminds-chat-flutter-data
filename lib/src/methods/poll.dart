import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/poll_repository.dart';

class PollApi {
  final PollRepository pollRepository;

  PollApi({required this.pollRepository});

  Future<LMResponse<SubmitPollResponse>> submitPoll(
      SubmitPollRequest request) async {
    SubmitPollResponse response = await pollRepository.submitPoll(request);
    return LMResponse<SubmitPollResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest request) async {
    AddPollOptionResponse response =
        await pollRepository.addPollOption(request);
    return LMResponse<AddPollOptionResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<GetPollUsersResponse>> getPollUsers(
      GetPollUsersRequest request) async {
    GetPollUsersResponse response = await pollRepository.getPollUsers(request);
    return LMResponse<GetPollUsersResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<PostConversationResponse>> postPollConversation(
      PostPollConversationRequest request) async {
    PostConversationResponse response =
        await pollRepository.postPollConversation(request);
    return LMResponse<PostConversationResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }
}
