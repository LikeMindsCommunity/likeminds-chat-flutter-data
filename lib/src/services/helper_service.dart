import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/models/helper/decode_url_request_model.dart';
import 'package:likeminds_chat_fl/src/models/helper/decode_url_response_model.dart';
import 'package:likeminds_chat_fl/src/models/helper/tag_request_model.dart';
import 'package:likeminds_chat_fl/src/models/helper/tag_response_model.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

class HelperService {
  LMSDKCallback? callback;
  final ApiManager apiClient;

  HelperService({required this.apiClient}) {
    callback =
        DIService.getIt.isRegistered<LMSDKCallback>(instanceName: "LMCallback")
            ? DIService.getIt.get<LMSDKCallback>(instanceName: "LMCallback")
            : null;
  }

  Future<LMResponse<TagResponseModelEntity>> getTags(
      {required TagRequestModel request}) async {
    try {
      final response = await apiClient.client().get(
            apiClient.endPoints.tagsEndpoint,
            queryParameters: request.toJson(),
          );
      if (response.data['success'] == true && response.data['data'] != null) {
        return LMResponse.success(
          data: TagResponseModelEntity.fromJson(response.data),
        );
      } else {
        return LMResponse.error(errorMessage: response.data['message']);
      }
    } on DioException catch (e) {
      debugPrint("Error from get tags: $e");
       return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  Future<LMResponse<DecodeUrlResponseEntity>> decodeUrl(
      {required DecodeUrlRequest request}) async {
    try {
      final response = await apiClient.client().get(
        apiClient.endPoints.decodeUrlEndpoint,
        queryParameters: request.toJson(),
      );
      if (response.data['success'] == true && response.data['data'] != null) {
        return LMResponse.success(
          data: DecodeUrlResponseEntity.fromJson(response.data),
        );
      } else {
        return LMResponse.error(errorMessage: response.data['message']);
      }
    } on DioException catch (e) {
      debugPrint("Error from get tags: $e");
      return LMResponse.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }

  void routeProfilePage(String userId) {
    callback?.profileRouteCallback(lmUserId: userId);
  }
}
