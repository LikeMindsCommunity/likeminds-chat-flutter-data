import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/poll_service.dart';

class PollRepository {
  final PollService pollService;

  PollRepository({required this.pollService});

  Future<SubmitPollResponse> submitPoll(SubmitPollRequest request) async {
    SubmitPollResponseEntity responseEntity =
        await pollService.submitPoll(request);
    return SubmitPollResponse.fromEntity(responseEntity);
  }

  Future<AddPollOptionResponse> addPollOption(
      AddPollOptionRequest request) async {
    AddPollOptionResponseEntity responseEntity =
        await pollService.addPollOption(request);
    return AddPollOptionResponse.fromEntity(responseEntity);
  }

  Future<GetPollUsersResponse> getPollUsers(GetPollUsersRequest request) async {
    GetPollUsersResponseEntity responseEntity =
        await pollService.getPollUsers(request);
    return GetPollUsersResponse.fromEntity(responseEntity);
  }

  Future<PostConversationResponseEntity> postPollConversation(
      PostPollConversationRequest request) async {
    PostConversationResponseEntity responseEntity =
        await pollService.postPollConversation(request);
    return PostConversationResponse.fromEntity(responseEntity);
  }
}
