import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/poll_service.dart';

class PollRepository {
  final PollService pollService;

  PollRepository({required this.pollService});

  Future<LMResponse<void>> submitPoll(SubmitPollRequest request) async {
    return await pollService.submitPoll(request);
  }

  Future<LMResponse<AddPollOptionResponse>> addPollOption(
      AddPollOptionRequest request) async {
    LMResponse<AddPollOptionResponseEntity> responseEntity =
        await pollService.addPollOption(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: AddPollOptionResponse.fromEntity(responseEntity.data!),
    );
  }

  Future<LMResponse<GetPollUsersResponse>> getPollUsers(
      GetPollUsersRequest request) async {
    LMResponse<GetPollUsersResponseEntity> responseEntity =
        await pollService.getPollUsers(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: GetPollUsersResponse.fromEntity(responseEntity.data!),
    );
  }

  Future<LMResponse<PostConversationResponse>> postPollConversation(
      PostPollConversationRequest request) async {
    LMResponse<PostConversationResponseEntity> responseEntity =
        await pollService.postPollConversation(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: PostConversationResponse.fromEntity(responseEntity.data!),
    );
  }
}
