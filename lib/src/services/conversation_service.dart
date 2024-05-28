import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IConversationService {
  Future<LMResponse<GetConversationResponseEntity>> getConversation(
      GetConversationRequest request);
  Future<LMResponse<PostConversationResponseEntity>> postConversation(
      PostConversationRequest request);
  Future<LMResponse<EditConversationResponseEntity>> editConversation(
      EditConversationRequest request);
  Future<LMResponse<DeleteConversationResponseEntity>> deleteConversation(
      DeleteConversationRequest request);
}

class ConversationService extends IConversationService {
  final ApiManager _apiManager;

  ConversationService({required ApiManager apiManager})
      : _apiManager = apiManager;

  @override
  Future<LMResponse<GetConversationResponseEntity>> getConversation(
      GetConversationRequest request) async {
    try {
      final response = await _apiManager.get(
        _apiManager.endPoints.conversationSyncEndpoint,
        queryParameters: request.toJson(),
      );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse.success(
        data: GetConversationResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<PostConversationResponseEntity>> postConversation(
      PostConversationRequest request) async {
    try {
      final response = await _apiManager.client().post(
            _apiManager.endPoints.conversationEndpoint,
            data: request.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      return LMResponse.success(
        data: PostConversationResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<EditConversationResponseEntity>> editConversation(
      EditConversationRequest request) async {
    try {
      final response = await _apiManager.client().put(
            _apiManager.endPoints.conversationEndpoint,
            data: request.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      return LMResponse.success(
        data: EditConversationResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<DeleteConversationResponseEntity>> deleteConversation(
      DeleteConversationRequest request) async {
    try {
      final Response response = await _apiManager.client().delete(
            _apiManager.endPoints.conversationEndpoint,
            data: request.toJson(),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      return LMResponse.success(
        data: DeleteConversationResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e) {
      return LMResponse.error(
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }
}
