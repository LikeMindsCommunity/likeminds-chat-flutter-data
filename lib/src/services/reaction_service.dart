import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IReactionService {
  Future<PutReactionResponseEntity> putReaction(PutReactionRequest request);
  Future<DeleteReactionResponseEntity> deleteReaction(
      DeleteReactionRequest request);
}

class ReactionService extends IReactionService {
  final ApiManager apiManager;

  ReactionService({
    required this.apiManager,
  });

  @override
  Future<PutReactionResponseEntity> putReaction(
      PutReactionRequest request) async {
    try {
      final response = await apiManager.put(
        // conversation/reaction
        apiManager.endPoints.reactionEndpoint,
        data: request.toJson(),
      );
      PutReactionResponseEntity putReactionResponse =
          PutReactionResponseEntity.fromJson(response.data);
      return putReactionResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return PutReactionResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<DeleteReactionResponseEntity> deleteReaction(
      DeleteReactionRequest request) async {
    try {
      final response = await apiManager.delete(
        // conversation/reaction
        apiManager.endPoints.reactionEndpoint,
        data: request.toJson(),
      );
      DeleteReactionResponseEntity deleteReactionResponse =
          DeleteReactionResponseEntity.fromJson(response.data);
      return deleteReactionResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return DeleteReactionResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
