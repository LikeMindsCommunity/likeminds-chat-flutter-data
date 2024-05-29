import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/dm_repository.dart';

/// DMApi class is responsible for handling all the DM related API calls
class DMApi {
  final DMRepository dmRepository;

  DMApi({required this.dmRepository});

  Future<LMResponse<CheckDMTabResponse>> checkDMTab() async {
    return await dmRepository.checkDMTab();
  }

  Future<LMResponse<FetchDMFeedResponse>> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    return await dmRepository.fetchDMFeed(fetchDMFeedRequest);
  }

  Future<LMResponse<CheckDMStatusResponse>> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest) async {
    return await dmRepository.checkDMStatus(checkDMStatusRequest);
  }

  Future<LMResponse<GetAllMembersResponse>> getAllMembers(
      GetAllMembersRequest getAllMembersRequest) async {
    return await dmRepository.getAllMembers(getAllMembersRequest);
  }

  Future<LMResponse<SearchMembersResponse>> searchMembers(
      SearchMembersRequest searchMembersRequest) async {
    return await dmRepository.searchMembers(searchMembersRequest);
  }

  Future<LMResponse<CheckDMLimitResponse>> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest) async {
    return await dmRepository.checkDMLimit(checkDMLimitRequest);
  }

  Future<LMResponse<CreateDMChatroomResponse>> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest) async {
    return await dmRepository.createDMChatroom(createDMChatroomRequest);
  }

  Future<LMResponse<SendDMResponse>> sendDMRequest(
      SendDMRequest sendDMRequest) async {
    return await dmRepository.sendDMRequest(sendDMRequest);
  }

  Future<LMResponse<BlockMemberResponse>> blockMember(
      BlockMemberRequest blockMemberRequest) async {
    return await dmRepository.blockMember(blockMemberRequest);
  }
}
