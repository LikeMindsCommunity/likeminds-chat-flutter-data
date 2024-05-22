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
  Future<GetAllMembersResponseEntity> getAllMembers(
      GetAllMembersRequest getAllMembersRequest);
  Future<SearchMembersResponseEntity> searchMembers(
      SearchMembersRequest searchMembersRequest);
  Future<CheckDMLimitResponseEntity> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest);
  Future<CreateDMChatroomResponseEntity> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest);
  Future<SendDMResponseEntity> sendDMRequest(SendDMRequest sendDMRequest);
  Future<BlockMemberResponseEntity> blockMember(
      BlockMemberRequest blockMemberRequest);
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
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
    } on DioException catch (e) {
      debugPrint(e.message);
      return CheckDMStatusResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<GetAllMembersResponseEntity> getAllMembers(
      GetAllMembersRequest getAllMembersRequest) async {
    try {
      final response = await apiManager.get(
        //community/member
        apiManager.endPoints.getAllMembersEndpoint,
        queryParameters: getAllMembersRequest.toJson(),
      );
      GetAllMembersResponseEntity getAllMembersResponseEntity =
          GetAllMembersResponseEntity.fromJson(response.data);
      return getAllMembersResponseEntity;
    } on DioException catch (e) {
      debugPrint(e.message);
      return GetAllMembersResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<SearchMembersResponseEntity> searchMembers(
      SearchMembersRequest searchMembersRequest) async {
    try {
      final response = await apiManager.get(
        //community/member/search
        apiManager.endPoints.searchMembersEndpoint,
        queryParameters: searchMembersRequest.toJson(),
      );
      SearchMembersResponseEntity searchMembersResponseEntity =
          SearchMembersResponseEntity.fromJson(response.data);
      return searchMembersResponseEntity;
    } on DioException catch (e) {
      debugPrint(e.message);
      return SearchMembersResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<CheckDMLimitResponseEntity> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest) async {
    try {
      final response = await apiManager.get(
        // chatroom/dm/limit
        apiManager.endPoints.checkDMLimitEndpoint,
        queryParameters: checkDMLimitRequest.toJson(),
      );
      CheckDMLimitResponseEntity checkDMLimitResponseEntity =
          CheckDMLimitResponseEntity.fromJson(response.data);
      return checkDMLimitResponseEntity;
    } on DioException catch (e) {
      debugPrint(e.message);
      return CheckDMLimitResponseEntity(
          success: false, errorMessage: e.message);
    }
  }

  @override
  Future<CreateDMChatroomResponseEntity> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest) async {
    try {
      final response = await apiManager.post(
        // chatroom/dm/create
        apiManager.endPoints.createDMChatroomEndpoint,
        data: createDMChatroomRequest.toJson(),
      );
      CreateDMChatroomResponseEntity createDMChatroomResponseEntity =
          CreateDMChatroomResponseEntity.fromJson(response.data);
      return createDMChatroomResponseEntity;
    } on DioException catch (e) {
      debugPrint(e.message);
      return CreateDMChatroomResponseEntity(
          success: false, errorMessage: e.message);
    }
  }

  @override
  Future<SendDMResponseEntity> sendDMRequest(
      SendDMRequest sendDMRequest) async {
    try {
      final response = await apiManager.post(
        // chatroom/dm/request
        apiManager.endPoints.sendDMRequestEndpoint,
        data: sendDMRequest.toJson(),
      );
      SendDMResponseEntity sendDMResponseEntity =
          SendDMResponseEntity.fromJson(response.data);
      return sendDMResponseEntity;
    } on DioException catch (e) {
      debugPrint(e.message);
      return SendDMResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<BlockMemberResponseEntity> blockMember(
      BlockMemberRequest blockMemberRequest) async {
    try {
      final response = await apiManager.post(
        // chatroom/dm/block
        apiManager.endPoints.blockMemberEndpoint,
        data: blockMemberRequest.toJson(),
      );
      BlockMemberResponseEntity blockMemberResponseEntity =
          BlockMemberResponseEntity.fromJson(response.data);
      return blockMemberResponseEntity;
    } on DioException catch (e) {
      debugPrint(e.message);
      return BlockMemberResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
