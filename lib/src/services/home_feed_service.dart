import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/home/home_feed_request_model.dart';
import 'package:likeminds_chat_fl/src/models/home/home_feed_response_model.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IHomeFeedService {
  Future<LMResponse<GetHomeFeedResponseEntity>> getHomeFeed(
      GetHomeFeedRequest request);
}

class HomeFeedService extends IHomeFeedService {
  final ApiManager apiManager;

  HomeFeedService({
    required this.apiManager,
  });

  /// Get Home Feed API
  /// Calls our backend for getting the home feed of chatrooms
  /// Returns a [GetHomeFeedResponseEntity] object
  /// Throws [DioException] if something goes wrong
  @override
  Future<LMResponse<GetHomeFeedResponseEntity>> getHomeFeed(
    GetHomeFeedRequest request,
  ) async {
    try {
      final response = await apiManager.client().get(
        apiManager.endPoints.homeFeedEndpoint,
        queryParameters: request.toJson(),
      );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      GetHomeFeedResponseEntity homeFeedResponseEntity =
          GetHomeFeedResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: homeFeedResponseEntity);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }
}
