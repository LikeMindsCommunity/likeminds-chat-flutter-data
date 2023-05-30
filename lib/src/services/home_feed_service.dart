import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/home/home_feed_request_model.dart';
import 'package:likeminds_chat_fl/src/models/home/home_feed_response_model.dart';

abstract class IHomeFeedService {
  Future<GetHomeFeedResponseEntity> getHomeFeed(GetHomeFeedRequest request);
}

class HomeFeedService extends IHomeFeedService {
  final ApiManager apiManager;

  HomeFeedService({
    required this.apiManager,
  });

  /// Get Home Feed API
  /// Calls our backend for getting the home feed of chatrooms
  /// Returns a [GetHomeFeedResponseEntity] object
  /// Throws [DioError] if something goes wrong
  @override
  Future<GetHomeFeedResponseEntity> getHomeFeed(
    GetHomeFeedRequest request,
  ) async {
    try {
      final response = await apiManager.get(
        apiManager.endPoints.homeFeedEndpoint,
        queryParameters: request.toJson(),
      );
      GetHomeFeedResponseEntity homeFeedResponseEntity =
          GetHomeFeedResponseEntity.fromJson(response.data);
      return homeFeedResponseEntity;
    } on DioError catch (e) {
      debugPrint(e.message);
      return GetHomeFeedResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
