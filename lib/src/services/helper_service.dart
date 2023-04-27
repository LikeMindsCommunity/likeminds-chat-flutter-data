import 'package:dio/dio.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/methods/callback.dart';
import 'package:likeminds_chat_fl/src/models/helper/decode_url_request_model.dart';
import 'package:likeminds_chat_fl/src/models/helper/decode_url_response_model.dart';
import 'package:likeminds_chat_fl/src/models/helper/tag_request_model.dart';
import 'package:likeminds_chat_fl/src/models/helper/tag_response_model.dart';
import 'package:likeminds_chat_fl/src/services/di_service.dart';

class HelperService {
  late final LMSdkCallback callback;
  final ApiManager apiClient;

  HelperService({required this.apiClient}) {
    callback = DIService.getIt.get<LMSdkCallback>(
      instanceName: "LMCallback",
    );
  }

  Future<TagResponseModelEntity> getTags(
      {required TagRequestModel request}) async {
    try {
      final response = await apiClient.client().get(
        apiClient.endPoints.tagsEndpoint,
        options: Options(
          headers: {
            'x-api-key': '${apiClient.tokenManager.apiKey}',
          },
        ),
        queryParameters: {
          'chatroom_id': request.chatroomId,
          'page': request.page,
          'page_size': request.pageSize,
          'search_name': request.searchQuery,
        },
      );
      if (response.data['success'] == true) {
        return TagResponseModelEntity.fromJson(response.data);
      } else {
        return TagResponseModelEntity(
          success: false,
          errorMessage: response.data['message'],
        );
      }
    } on DioError catch (e) {
      print("Error from get tags: $e");
      return TagResponseModelEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  Future<DecodeUrlResponseEntity> decodeUrl(
      {required DecodeUrlRequest request}) async {
    try {
      final response = await apiClient.client().get(
        apiClient.endPoints.decodeUrlEndpoint,
        options: Options(
          headers: {
            'Authorization': '${apiClient.tokenManager.accessToken}',
          },
        ),
        queryParameters: {
          'url': request.url,
        },
      );
      if (response.data['success'] == true) {
        return DecodeUrlResponseEntity.fromJson(response.data);
      } else {
        return DecodeUrlResponseEntity(
          success: false,
          errorMessage: response.data['message'],
        );
      }
    } on DioError catch (e) {
      print("Error from get tags: $e");
      return DecodeUrlResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }

  void routeProfilePage(String userId) {
    callback.profileRouteCallback(lmUserId: userId);
  }
}
