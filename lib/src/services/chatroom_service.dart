import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IChatroomService {
  Future<LMResponse<GetChatroomResponseEntity>> getChatroom(
      GetChatroomRequest request);
  Future<LMResponse<void>> followChatroom(FollowChatroomRequest request);
  Future<LMResponse<void>> muteChatroom(MuteChatroomRequest request);
  Future<LMResponse<void>> markReadChatroom(MarkReadChatroomRequest request);
  Future<LMResponse<void>> shareChatroomUrl(ShareChatroomRequest request);
  Future<LMResponse<void>> setChatroomTopic(SetChatroomTopicRequest request);
  Future<LMResponse<void>> deleteParticipant(DeleteParticipantRequest request);
}

class ChatroomService extends IChatroomService {
  final ApiManager apiManager;

  ChatroomService({required this.apiManager});

  @override
  Future<LMResponse<GetChatroomResponseEntity>> getChatroom(
      GetChatroomRequest request) async {
    try {
      final response = await apiManager.client().get(
        apiManager.endPoints.chatroomEndpoint,
        queryParameters: request.toJson(),
      );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(
        data: GetChatroomResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<void>> followChatroom(FollowChatroomRequest request) async {
    try {
      final response = await apiManager.client().put(
            apiManager.endPoints.chatroomFollowEndpoint,
            queryParameters: request.toJson(),
          );
      if (!response.data['success']) {
        LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(data: null);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<void>> markReadChatroom(
      MarkReadChatroomRequest request) async {
    try {
      final response = await apiManager.client().post(
            apiManager.endPoints.chatroomMarkReadEndpoint,
            data: request.toJson(),
          );
      if (!response.data['success']) {
        LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(data: null);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<void>> muteChatroom(MuteChatroomRequest request) async {
    try {
      final response = await apiManager.client().put(
            apiManager.endPoints.chatroomMuteEndpoint,
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
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<void>> shareChatroomUrl(
      ShareChatroomRequest request) async {
    try {
      final response = await apiManager.client().get(
        apiManager.endPoints.chatroomShareEndpoint,
        queryParameters: request.toJson(),
      );
      if (!response.data['success']) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(data: null);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<void>> setChatroomTopic(
      SetChatroomTopicRequest request) async {
    try {
      final response = await apiManager.client().put(
            apiManager.endPoints.chatroomSetTopicEndpoint,
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
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<void>> deleteParticipant(
      DeleteParticipantRequest request) async {
    try {
      final response = await apiManager.client().delete(
            apiManager.endPoints.chatroomParticipantsEndpoint,
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
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }
}
