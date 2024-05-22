import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/dm_repository.dart';

class DMApi {
  final DMRepository dmRepository;

  DMApi({required this.dmRepository});

  Future<LMResponse<CheckDMTabResponse>> checkDMTab() async {
    final response = await dmRepository.checkDMTab();
    return LMResponse<CheckDMTabResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<FetchDMFeedResponse>> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    final response = await dmRepository.fetchDMFeed(fetchDMFeedRequest);
    return LMResponse<FetchDMFeedResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<CheckDMStatusResponse>> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest) async {
    final response = await dmRepository.checkDMStatus(checkDMStatusRequest);
    return LMResponse<CheckDMStatusResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<GetAllMembersResponse>> getAllMembers(
      GetAllMembersRequest getAllMembersRequest) async {
    final response = await dmRepository.getAllMembers(getAllMembersRequest);
    return LMResponse<GetAllMembersResponse>(
        success: response.success,
        errorMessage: response.errorMessage,
        data: response);
  }

  Future<LMResponse<SearchMembersResponse>> searchMembers(
      SearchMembersRequest searchMembersRequest) async {
    final response = await dmRepository.searchMembers(searchMembersRequest);
    return LMResponse<SearchMembersResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<CheckDMLimitResponse>> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest) async {
    final response = await dmRepository.checkDMLimit(checkDMLimitRequest);
    return LMResponse<CheckDMLimitResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<CreateDMChatroomResponse>> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest) async {
    final response =
        await dmRepository.createDMChatroom(createDMChatroomRequest);
    return LMResponse<CreateDMChatroomResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<SendDMResponse>> sendDMRequest(
      SendDMRequest sendDMRequest) async {
    final response = await dmRepository.sendDMRequest(sendDMRequest);
    return LMResponse(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<BlockMemberResponse>> blockMember(
      BlockMemberRequest blockMemberRequest) async {
    final response = await dmRepository.blockMember(blockMemberRequest);
    return LMResponse(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }
}
