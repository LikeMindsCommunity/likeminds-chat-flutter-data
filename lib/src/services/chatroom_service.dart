import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IChatroomService {
  Future<GetChatroomResponseEntity> getChatroom(GetChatroomRequest request);
  Future<FollowChatroomResponse> followChatroom(FollowChatroomRequest request);
  Future<MuteChatroomResponse> muteChatroom(MuteChatroomRequest request);
  Future<MarkReadChatroomResponse> markReadChatroom(
      MarkReadChatroomRequest request);
  Future<ShareChatroomResponse> shareChatroomUrl(ShareChatroomRequest request);
  Future<SetChatroomTopicResponse> setChatroomTopic(
      SetChatroomTopicRequest request);
  Future<DeleteParticipantResponse> deleteParticipant(
      DeleteParticipantRequest request);
}

class ChatroomService extends IChatroomService {
  final ApiManager apiManager;

  ChatroomService({required this.apiManager});

  @override
  Future<GetChatroomResponseEntity> getChatroom(
      GetChatroomRequest request) async {
    try {
      final response = await apiManager.get(
        apiManager.endPoints.chatroomEndpoint,
        queryParameters: request.toJson(),
      );
      return GetChatroomResponseEntity.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.message);
      return GetChatroomResponseEntity(success: false, errorMessage: e.message);
    }
  }

  @override
  Future<FollowChatroomResponse> followChatroom(
      FollowChatroomRequest request) async {
    try {
      final response = await apiManager.put(
        apiManager.endPoints.chatroomFollowEndpoint,
        queryParameters: request.toJson(),
      );
      return FollowChatroomResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.message);
      return FollowChatroomResponse(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<MarkReadChatroomResponse> markReadChatroom(
      MarkReadChatroomRequest request) async {
    try {
      final response = await apiManager.post(
        apiManager.endPoints.chatroomMarkReadEndpoint,
        data: request.toJson(),
      );
      return MarkReadChatroomResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return MarkReadChatroomResponse(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<MuteChatroomResponse> muteChatroom(MuteChatroomRequest request) async {
    try {
      final response = await apiManager.put(
        apiManager.endPoints.chatroomMuteEndpoint,
        data: request.toJson(),
      );
      return MuteChatroomResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.message);
      return MuteChatroomResponse(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<ShareChatroomResponse> shareChatroomUrl(
      ShareChatroomRequest request) async {
    try {
      final response = await apiManager.get(
        apiManager.endPoints.chatroomShareEndpoint,
        queryParameters: request.toJson(),
      );
      return ShareChatroomResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.message);
      return ShareChatroomResponse(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<SetChatroomTopicResponse> setChatroomTopic(
      SetChatroomTopicRequest request) async {
    try {
      final response = await apiManager.put(
        apiManager.endPoints.chatroomSetTopicEndpoint,
        data: request.toJson(),
      );
      return SetChatroomTopicResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.message);
      return SetChatroomTopicResponse(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<DeleteParticipantResponse> deleteParticipant(
      DeleteParticipantRequest request) async {
    try {
      final response = await apiManager.delete(
        apiManager.endPoints.chatroomParticipantsEndpoint,
        data: request.toJson(),
      );
      return DeleteParticipantResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.message);
      return DeleteParticipantResponse(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }
}
