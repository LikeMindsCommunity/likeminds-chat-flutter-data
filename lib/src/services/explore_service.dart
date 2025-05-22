import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/persistence/persistence.dart';

abstract class IExploreService {
  Future<LMResponse<GetExploreTabCountResponseEntity>> getExploreTabCount();
  Future<LMResponse<GetExploreFeedResponseEntity>> getExploreFeed(
      GetExploreFeedRequest request);
}

class ExploreService extends IExploreService {
  final ApiManager apiManager;

  ExploreService({
    required this.apiManager,
  });

  @override
  Future<LMResponse<GetExploreTabCountResponseEntity>>
      getExploreTabCount() async {
    try {
      final response = await apiManager.client().get(
            // community/member/home/meta
            apiManager.endPoints.exploreTabCountEndpoint,
          );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      GetExploreTabCountResponseEntity getExploreTabCountResponse =
          GetExploreTabCountResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: getExploreTabCountResponse);
    } on DioException catch (e, stacktrace) {
      LMChatPersistence.instance.handleException(e, stacktrace);
      debugPrint(e.message);
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<GetExploreFeedResponseEntity>> getExploreFeed(
      GetExploreFeedRequest request) async {
    try {
      final response = await apiManager.client().get(
            // community/feed
            apiManager.endPoints.exploreFeedEndpoint,
            queryParameters: request.toJson(),
            options: Options(
              headers: {
                'x-accept-version': 'v2',
              },
            ),
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      GetExploreFeedResponseEntity getExploreFeedResponse =
          GetExploreFeedResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: getExploreFeedResponse);
    } on DioException catch (e, stacktrace) {
      LMChatPersistence.instance.handleException(e, stacktrace);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
