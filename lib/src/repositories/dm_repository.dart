import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/dm_service.dart';

class DMRepository {
  final DMService dmService;

  DMRepository({
    required this.dmService,
  });

  Future<LMResponse<CheckDMTabResponse>> checkDMTab() async {
    final response = await dmService.checkDMTab();
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: CheckDMTabResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<FetchDMFeedResponse>> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    final response = await dmService.fetchDMFeed(fetchDMFeedRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: FetchDMFeedResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<CheckDMStatusResponse>> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest) async {
    final response = await dmService.checkDMStatus(checkDMStatusRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: CheckDMStatusResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<GetAllMembersResponse>> getAllMembers(
      GetAllMembersRequest getAllMembersRequest) async {
    final response = await dmService.getAllMembers(getAllMembersRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: GetAllMembersResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<SearchMembersResponse>> searchMembers(
      SearchMembersRequest searchMembersRequest) async {
    final response = await dmService.searchMembers(searchMembersRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: SearchMembersResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<CheckDMLimitResponse>> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest) async {
    final response = await dmService.checkDMLimit(checkDMLimitRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: CheckDMLimitResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<CreateDMChatroomResponse>> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest) async {
    final response = await dmService.createDMChatroom(createDMChatroomRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: CreateDMChatroomResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<SendDMResponse>> sendDMRequest(
      SendDMRequest sendDMRequest) async {
    final response = await dmService.sendDMRequest(sendDMRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: SendDMResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<BlockMemberResponse>> blockMember(
      BlockMemberRequest blockMemberRequest) async {
    final response = await dmService.blockMember(blockMemberRequest);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: BlockMemberResponse.fromEntity(response.data!),
    );
  }
}
