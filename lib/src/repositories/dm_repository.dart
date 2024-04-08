import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/dm_service.dart';

class DMRepository {
  final DMService dmService;

  DMRepository({
    required this.dmService,
  });

  Future<CheckDMTabResponse> checkDMTab() async {
    final response = await dmService.checkDMTab();
    return CheckDMTabResponse.fromEntity(response);
  }

  Future<FetchDMFeedResponse> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    final response = await dmService.fetchDMFeed(fetchDMFeedRequest);
    return FetchDMFeedResponse.fromEntity(response);
  }

  Future<CheckDMStatusResponse> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest) async {
    final response = await dmService.checkDMStatus(checkDMStatusRequest);
    return CheckDMStatusResponse.fromEntity(response);
  }

  Future<GetAllMembersResponse> getAllMembers(
      GetAllMembersRequest getAllMembersRequest) async {
    final response = await dmService.getAllMembers(getAllMembersRequest);
    return GetAllMembersResponse.fromEntity(response);
  }

  Future<SearchMembersResponse> searchMembers(
      SearchMembersRequest searchMembersRequest) async {
    final response = await dmService.searchMembers(searchMembersRequest);
    return SearchMembersResponse.fromEntity(response);
  }

  Future<CheckDMLimitResponse> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest) async {
    final response = await dmService.checkDMLimit(checkDMLimitRequest);
    return CheckDMLimitResponse.fromEntity(response);
  }

  Future<CreateDMChatroomResponse> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest) async {
    final response = await dmService.createDMChatroom(createDMChatroomRequest);
    return CreateDMChatroomResponse.fromEntity(response);
  }

  Future<SendDMResponse> sendDMRequest(SendDMRequest sendDMRequest) async {
    final response = await dmService.sendDMRequest(sendDMRequest);
    return SendDMResponse.fromEntity(response);
  }

  Future<BlockMemberResponse> blockMember(
      BlockMemberRequest blockMemberRequest) async {
    final response = await dmService.blockMember(blockMemberRequest);
    return BlockMemberResponse.fromEntity(response);
  }
}
