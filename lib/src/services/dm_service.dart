// checkDMTab(CheckDMTabResponse? -> Unit)

// Call home/dm/meta with GET method to check whether to show DM Tab or not

// If home/dm/meta success==false

// return checkDMTabResponse={success=false, errorMessage-=<returned in home/dm/meta>}

// else

// return checkDMTabResponse={success=true,LMResponse<CheckDMTabResponse>}

// fetchDMFeed(FetchDMFeedRequest, FetchDMFeedResponse? -> Unit)

// Call chatroom/dm with GET method and page received in FetchDMFeedRequest to fetch the dm feed.

// If chatroom/dm success==false

// return fetchDMFeedResponse={success=false, errorMessage-=<returned in chatroom/dm>}

// else

// return fetchDMFeedResponse={success=true,LMResponse<FetchDMFeedResponse>}

// checkDMStatus(CheckDMStatusRequest, CheckDMStatusResponse? -> Unit)

// Call community/dm/status with GET method and requestFrom received in CheckDMStatusRequest to check whether user can DM or not.

// If community/dm/status success==false

// return checkDMStatusResponse={success=false, errorMessage-=<returned in community/dm/status>}

// else

// return checkDMStatusResponse={success=true,LMResponse<CheckDMStatusResponse>}

// getAllMembers(GetAllMembersRequest, GetAllMembersResponse? -> Unit)

// Call community/member with the GET method and memberState received in GetAllMembersRequest the all members list

// If community/member success==false

// return getAllMembersResponse={success=false, errorMessage-=<returned in community/member>}

// else

// return getAllMembersResponse={success=true,LMResponse<GetAllMembersResponse>}

// searchMembers(SearchMembersRequest, SearchMembersResponse? -> Unit)

// Call community/member/search with the GET method and search and searchType=name to get search results

// If community/member/search success==false

// return searchMembersResponse={success=false, errorMessage-=<returned in community/member/search>}

// else

// return searchMembersResponse={success=true,LMResponse<SearchMembersResponse>}

// checkDMLimit(CheckDMLimitRequest, CheckDMLimitResponse? -> Unit)

// Call chatroom/dm/limit with GET method and memberId received in CheckDMLimitRequest to check if member can send request or not.

// If chatroom/dm/limit success==false

// return checkDMLimitResponse={success=false, errorMessage-=<returned in chatroom/dm/limit>}

// else

// return checkDMLimitResponse={success=true,LMResponse<CheckDMLimitResponse>}

// createDMChatroom(CreateDMChatroomRequest, CheckDMChatroomResponse? -> Unit)

// Call chatroom/dm/create with POST method and memberId received in CreateDMChatroomRequest to create the chatroom if not present

// If chatroom/dm/create success==false

// return checkDMChatroomResponse={success=false, errorMessage-=<returned in chatroom/dm/create>}

// else

// returncheckDMChatroomResponse={success=true,LMResponse<CheckDMChatroomResponse>}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IDMService {
  Future<CheckDMTabResponseEntity> checkDMTab();
  Future<FetchDMFeedResponseEntity> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest);
  Future<CheckDMStatusResponseEntity> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest);
}

class DMService extends IDMService {
  final ApiManager apiManager;

  DMService({
    required this.apiManager,
  });

  @override
  Future<CheckDMTabResponseEntity> checkDMTab() async {
    try {
      final response = await apiManager.get(
        // home/dm/meta
        apiManager.endPoints.checkDMEndpoint,
      );
      CheckDMTabResponseEntity checkDMTabResponse =
          CheckDMTabResponseEntity.fromJson(response.data);
      return checkDMTabResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return CheckDMTabResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<FetchDMFeedResponseEntity> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    try {
      final response = await apiManager.get(
        // chatroom/dm
        apiManager.endPoints.dmEndpoint,
        queryParameters: fetchDMFeedRequest.toJson(),
      );
      FetchDMFeedResponseEntity fetchDMFeedResponse =
          FetchDMFeedResponseEntity.fromJson(response.data);
      return fetchDMFeedResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return FetchDMFeedResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<CheckDMStatusResponseEntity> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest) async {
    try {
      final response = await apiManager.get(
        // community/dm/status
        apiManager.endPoints.checkDMStatusEndpoint,
        queryParameters: checkDMStatusRequest.toJson(),
      );
      CheckDMStatusResponseEntity checkDMStatusResponse =
          CheckDMStatusResponseEntity.fromJson(response.data);
      return checkDMStatusResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return CheckDMStatusResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
