import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IPollService {
  Future<PostPollConversationResponseEntity> postPollConversation(
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
  Future<PostPollConversationResponseEntity> postPollConversation(
      PostPollConversationRequest request) async {
    try {
      final response = await apiManager.post(
        // conversation
        apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );
      PostPollConversationResponseEntity postPollConversationResponse =
          PostPollConversationResponseEntity.fromJson(response.data);
      return postPollConversationResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return PostPollConversationResponseEntity(
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
        // conversation/poll/users
        apiManager.endPoints.pollUsersEndpoint,
        queryParameters: request.toJson(),
      );
      GetPollUsersResponseEntity getPollUsersResponse =
          GetPollUsersResponseEntity.fromJson(response.data);
      return getPollUsersResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return GetPollUsersResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<AddPollOptionResponseEntity> addPollOption(
      AddPollOptionRequest request) async {
    try {
      final response = await apiManager.post(
        // conversation/poll
        apiManager.endPoints.pollEndpoint,
        data: request.toJson(),
      );
      AddPollOptionResponseEntity addPollOptionResponse =
          AddPollOptionResponseEntity.fromJson(response.data);
      return addPollOptionResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return AddPollOptionResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<SubmitPollResponseEntity> submitPoll(SubmitPollRequest request) async {
    try {
      final response = await apiManager.post(
        // conversation/poll/submit
        apiManager.endPoints.pollSubmitEndpoint,
        data: request.toJson(),
      );
      SubmitPollResponseEntity submitPollResponse =
          SubmitPollResponseEntity.fromJson(response.data);
      return submitPollResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return SubmitPollResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
