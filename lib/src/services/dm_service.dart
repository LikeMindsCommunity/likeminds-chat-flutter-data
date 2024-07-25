import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IDMService {
  Future<LMResponse<CheckDMTabResponseEntity>> checkDMTab();
  Future<LMResponse<FetchDMFeedResponseEntity>> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest);
  Future<LMResponse<CheckDMStatusResponseEntity>> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest);
  Future<LMResponse<GetAllMembersResponseEntity>> getAllMembers(
      GetAllMembersRequest getAllMembersRequest);
  Future<LMResponse<SearchMembersResponseEntity>> searchMembers(
      SearchMembersRequest searchMembersRequest);
  Future<LMResponse<CheckDMLimitResponseEntity>> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest);
  Future<LMResponse<CreateDMChatroomResponseEntity>> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest);
  Future<LMResponse<SendDMResponseEntity>> sendDMRequest(
      SendDMRequest sendDMRequest);
  Future<LMResponse<BlockMemberResponseEntity>> blockMember(
      BlockMemberRequest blockMemberRequest);
}

class DMService extends IDMService {
  final ApiManager apiManager;

  DMService({
    required this.apiManager,
  });

  @override
  Future<LMResponse<CheckDMTabResponseEntity>> checkDMTab() async {
    try {
      final response = await apiManager.client().get(
            apiManager.endPoints.checkDMEndpoint,
            options: Options(
              headers: {
                'x-api-version': 1,
              },
            ),
          );
      debugPrint(response.requestOptions.headers.toString());
      debugPrint('---------------DMResponse: ${response.data}-------------');
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
            errorMessage:
                response.data['error_message'] ?? 'An error occurred');
      }

      CheckDMTabResponseEntity checkDMTabResponse =
          CheckDMTabResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: checkDMTabResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<FetchDMFeedResponseEntity>> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    try {
      final response = await apiManager.client().get(
            apiManager.endPoints.dmEndpoint,
            queryParameters: fetchDMFeedRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      FetchDMFeedResponseEntity fetchDMFeedResponse =
          FetchDMFeedResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: fetchDMFeedResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<CheckDMStatusResponseEntity>> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest) async {
    try {
      final response = await apiManager.client().get(
            // community/dm/status
            options: Options(
              headers: {
                'x-api-version': 1,
              },
            ),
            apiManager.endPoints.checkDMStatusEndpoint,
            queryParameters: checkDMStatusRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      CheckDMStatusResponseEntity checkDMStatusResponse =
          CheckDMStatusResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: checkDMStatusResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<GetAllMembersResponseEntity>> getAllMembers(
      GetAllMembersRequest getAllMembersRequest) async {
    try {
      final response = await apiManager.client().get(
            //community/member
            apiManager.endPoints.getAllMembersEndpoint,
            queryParameters: getAllMembersRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      GetAllMembersResponseEntity getAllMembersResponseEntity =
          GetAllMembersResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: getAllMembersResponseEntity);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<SearchMembersResponseEntity>> searchMembers(
      SearchMembersRequest searchMembersRequest) async {
    try {
      final response = await apiManager.client().get(
            //community/member/search
            apiManager.endPoints.searchMembersEndpoint,
            queryParameters: searchMembersRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      SearchMembersResponseEntity searchMembersResponseEntity =
          SearchMembersResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: searchMembersResponseEntity);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<CheckDMLimitResponseEntity>> checkDMLimit(
      CheckDMLimitRequest checkDMLimitRequest) async {
    try {
      final response = await apiManager.client().get(
            // chatroom/dm/limit
            apiManager.endPoints.checkDMLimitEndpoint,
            queryParameters: checkDMLimitRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      CheckDMLimitResponseEntity checkDMLimitResponseEntity =
          CheckDMLimitResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: checkDMLimitResponseEntity);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<CreateDMChatroomResponseEntity>> createDMChatroom(
      CreateDMChatroomRequest createDMChatroomRequest) async {
    try {
      final response = await apiManager.client().post(
            // chatroom/dm/create
            apiManager.endPoints.createDMChatroomEndpoint,
            data: createDMChatroomRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      CreateDMChatroomResponseEntity createDMChatroomResponseEntity =
          CreateDMChatroomResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: createDMChatroomResponseEntity);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<SendDMResponseEntity>> sendDMRequest(
      SendDMRequest sendDMRequest) async {
    try {
      final response = await apiManager.client().post(
            // chatroom/dm/request
            apiManager.endPoints.sendDMRequestEndpoint,
            data: sendDMRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      SendDMResponseEntity sendDMResponseEntity =
          SendDMResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: sendDMResponseEntity);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<BlockMemberResponseEntity>> blockMember(
      BlockMemberRequest blockMemberRequest) async {
    try {
      final response = await apiManager.client().post(
            // chatroom/dm/block
            apiManager.endPoints.blockMemberEndpoint,
            data: blockMemberRequest.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      BlockMemberResponseEntity blockMemberResponseEntity =
          BlockMemberResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: blockMemberResponseEntity);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
