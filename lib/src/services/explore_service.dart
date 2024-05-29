// getExploreTabCount(GetExploreTabCountResponse? -> Unit)

// Call community/member/home/meta with GET method to get explore tab count.

// if community/member/home/meta success==false

// returngetExploreTabCountResponse:{success=false, errorMessage:<returned in community/member/home/meta>}

// else

// return getExploreTabCountResponse:{success=true, LMResponse<GetExploreTabCountResponse>}

// getExploreFeed(GetExploreFeedRequest, GetExploreFeedResponse? -> Unit)

// Call community/feed with GET method and with x-accept-version=v2(Headers), page, orderType, pinned received in GetExploreFeedRequest to get explore feed chatrooms

// If community/feed success==false

// return getExploreFeedResponse: {success: false, errorMessage: <returned in community/feed>,  initiateResponse: <returned in initiate()>}

// else

// return getExploreFeedResponse: {success: true, LMResponse<GetExploreFeedResponse>}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

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
      final response = await apiManager.get(
        // community/member/home/meta
        apiManager.endPoints.exploreTabCountEndpoint,
      );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      GetExploreTabCountResponseEntity getExploreTabCountResponse =
          GetExploreTabCountResponseEntity.fromJson(response.data);
      return LMResponse.success(data: getExploreTabCountResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(errorMessage: e.message ?? 'An error occurred');
    }
  }

  @override
  Future<LMResponse<GetExploreFeedResponseEntity>> getExploreFeed(
      GetExploreFeedRequest request) async {
    try {
      final response = await apiManager.get(
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
          GetExploreFeedResponseEntity.fromJson(response.data);
      return LMResponse.success(data: getExploreFeedResponse);
    } on DioException catch (e) {
      debugPrint(e.message);
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
