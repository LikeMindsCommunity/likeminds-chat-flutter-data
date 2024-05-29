import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IReactionService {
  Future<LMResponse<void>> putReaction(PutReactionRequest request);
  Future<LMResponse<void>> deleteReaction(DeleteReactionRequest request);
}

class ReactionService extends IReactionService {
  final ApiManager apiManager;

  ReactionService({
    required this.apiManager,
  });

  @override
  Future<LMResponse<void>> putReaction(PutReactionRequest request) async {
    try {
      final response = await apiManager.client().put(
            // conversation/reaction
            apiManager.endPoints.reactionEndpoint,
            data: request.toJson(),
          );
      if (!response.data['success']) {
        return LMResponse.error(
            errorMessage:
                response.data['error_message'] ?? 'An error occurred');
      }
      return LMResponse.success(data: null);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }

  @override
  Future<LMResponse<void>> deleteReaction(DeleteReactionRequest request) async {
    try {
      final response = await apiManager.client().delete(
            // conversation/reaction
            apiManager.endPoints.reactionEndpoint,
            data: request.toJson(),
          );
      if (!response.data['success']) {
        return LMResponse.error(
            errorMessage:
                response.data['error_message'] ?? 'An error occurred');
      }
      return LMResponse.success(data: null);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.response?.data['error_message'] ?? 'An error occurred',
      );
    }
  }
}
