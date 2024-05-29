import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IPollService {
  Future<LMResponse<PostConversationResponseEntity>> postPollConversation(
      PostPollConversationRequest request);
  Future<LMResponse<GetPollUsersResponseEntity>> getPollUsers(
      GetPollUsersRequest request);
  Future<LMResponse<AddPollOptionResponseEntity>> addPollOption(
      AddPollOptionRequest request);
  Future<LMResponse<void>> submitPoll(SubmitPollRequest request);
}

class PollService extends IPollService {
  final ApiManager apiManager;

  PollService({
    required this.apiManager,
  });

  @override
  Future<LMResponse<PostConversationResponseEntity>> postPollConversation(
      PostPollConversationRequest request) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.conversationEndpoint,
            data: request.toJson(),
          );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      PostConversationResponseEntity postConversationResponse =
          PostConversationResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: postConversationResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<GetPollUsersResponseEntity>> getPollUsers(
      GetPollUsersRequest request) async {
    try {
      final response = await apiManager.client().get(
        apiManager.endPoints.pollUsersEndpoint,
        queryParameters: request.toJson(),
      );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      GetPollUsersResponseEntity getPollUsersResponse =
          GetPollUsersResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: getPollUsersResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<AddPollOptionResponseEntity>> addPollOption(
      AddPollOptionRequest request) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.pollAddOptionEndpoint,
            data: request.toJson(),
          );
      response.data["temporary_id"] = request.temporaryId;
      if (!response.data['success']) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      AddPollOptionResponseEntity addPollOptionResponse =
          AddPollOptionResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: addPollOptionResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<void>> submitPoll(SubmitPollRequest request) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.pollSubmitEndpoint,
            data: request.toJson(),
          );
      if (!response.data['success']) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(data: null);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
