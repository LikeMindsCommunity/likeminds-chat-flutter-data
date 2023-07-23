import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IConversationService {
  Future<GetConversationResponseEntity> getConversation(
      GetConversationRequest request);
  Future<PostConversationResponseEntity> postConversation(
      PostConversationRequest request);
  Future<EditConversationResponseEntity> editConversation(
      EditConversationRequest request);
  Future<DeleteConversationResponseEntity> deleteConversation(
      DeleteConversationRequest request);
}

class ConversationService extends IConversationService {
  final ApiManager _apiManager;

  ConversationService({required ApiManager apiManager})
      : _apiManager = apiManager;

  @override
  Future<GetConversationResponseEntity> getConversation(
      GetConversationRequest request) async {
    try {
      final response = await _apiManager.get(
        _apiManager.endPoints.conversationSyncEndpoint,
        queryParameters: request.toJson(),
      );

      return GetConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return GetConversationResponseEntity(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<PostConversationResponseEntity> postConversation(
      PostConversationRequest request) async {
    try {
      final response = await _apiManager.post(
        _apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );

      return PostConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return PostConversationResponseEntity(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<EditConversationResponseEntity> editConversation(
      EditConversationRequest request) async {
    try {
      final response = await _apiManager.put(
        _apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );

      return EditConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return EditConversationResponseEntity(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<DeleteConversationResponseEntity> deleteConversation(
      DeleteConversationRequest request) async {
    try {
      final response = await _apiManager.delete(
        _apiManager.endPoints.conversationEndpoint,
        data: request.toJson(),
      );

      return DeleteConversationResponseEntity.fromJson(response.data);
    } on DioError catch (e) {
      return DeleteConversationResponseEntity(
        success: false,
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }
}
