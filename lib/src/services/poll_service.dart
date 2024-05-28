import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IPollService {
  Future<PostConversationResponseEntity> postPollConversation(
      PostPollConversationRequest request);
  Future<GetPollUsersResponseEntity> getPollUsers(GetPollUsersRequest request);
  Future<AddPollOptionResponseEntity> addPollOption(
      AddPollOptionRequest request);
  Future<SubmitPollResponseEntity> submitPoll(SubmitPollRequest request);
}

class PollService extends IPollService {
  final ApiManager apiManager;

  PollService({
    required this.apiManager,
  });

  @override
  Future<PostConversationResponseEntity> postPollConversation(
      PostPollConversationRequest request) async {
    try {
      final response = await apiManager.client().post(
        apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );
      PostConversationResponseEntity postPollConversationResponse =
          PostConversationResponseEntity.fromJson(response.data);
      return postPollConversationResponse;
    } on DioException catch (e) {
      debugPrint(e.message);
      return PostConversationResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<GetPollUsersResponseEntity> getPollUsers(
      GetPollUsersRequest request) async {
    try {
      final response = await apiManager.get(
        apiManager.endPoints.pollUsersEndpoint,
        queryParameters: request.toJson(),
      );
      GetPollUsersResponseEntity getPollUsersResponse =
          GetPollUsersResponseEntity.fromJson(response.data);
      return getPollUsersResponse;
    } on DioException catch (e) {
      debugPrint(e.message);
      return GetPollUsersResponseEntity(
        success: false,
        errorMessage: e.response?.data["error_message"] ?? "An error occured",
      );
    }
  }

  @override
  Future<AddPollOptionResponseEntity> addPollOption(
      AddPollOptionRequest request) async {
    try {
      final response = await apiManager.client().post(
        apiManager.endPoints.pollAddOptionEndpoint,
        data: request.toJson(),
      );
      response.data["temporary_id"] = request.temporaryId;
      AddPollOptionResponseEntity addPollOptionResponse =
          AddPollOptionResponseEntity.fromJson(response.data);
      return addPollOptionResponse;
    } on DioException catch (e) {
      debugPrint(e.message);
      return AddPollOptionResponseEntity(
          success: false,
          errorMessage: e.message,
          temporaryId: request.temporaryId);
    }
  }

  @override
  Future<SubmitPollResponseEntity> submitPoll(SubmitPollRequest request) async {
    try {
      final response = await apiManager.client().post(
        apiManager.endPoints.pollSubmitEndpoint,
        data: request.toJson(),
      );
      SubmitPollResponseEntity submitPollResponse =
          SubmitPollResponseEntity.fromJson(response.data);
      return submitPollResponse;
    } on DioException catch (e) {
      debugPrint(e.message);
      if (e.response != null &&
          e.response!.data != null &&
          e.response!.data.runtimeType == Map) {
        return SubmitPollResponseEntity(
          success: false,
          errorMessage: e.response?.data["error_message"] ?? "An error occured",
        );
      }
      return SubmitPollResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
