import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

class ModerationService {
  final ApiManager apiManager;

  ModerationService({
    required this.apiManager,
  });

  Future<LMResponse<GetReportTagResponseEntity>> getReportTags(
      GetReportTagRequest reportTagRequest) async {
    try {
      final Response response = await apiManager.client().get(
            apiManager.endPoints.reportTagEndpoint,
            queryParameters: reportTagRequest.toJson(),
          );
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
            errorMessage:
                response.data['error_message'] ?? 'An error occurred');
      }

      GetReportTagResponseEntity getReportTagResponse =
          GetReportTagResponseEntity.fromJson(response.data['data']);
      return LMResponse.success(data: getReportTagResponse);
    } on DioException catch (error) {
      debugPrint(error.message);
      return LMResponse.error(
          errorMessage: error.message ?? 'An error occurred');
    }
  }

  Future<LMResponse<void>> postReport(
      PostReportRequest postReportRequest) async {
    try {
      return apiManager
          .client()
          .post(
            apiManager.endPoints.reportEndpoint,
            data: postReportRequest.toJson(),
          )
          .then((response) {
        if (!response.data['success']) {
          return LMResponse.error(
              errorMessage:
                  response.data['error_message'] ?? 'An error occurred');
        }
        return LMResponse.success(
          data: null,
        );
      });
    } on DioException catch (error) {
      debugPrint(error.message);
      return LMResponse.error(
          errorMessage: error.message ?? 'An error occurred');
    }
  }
}
