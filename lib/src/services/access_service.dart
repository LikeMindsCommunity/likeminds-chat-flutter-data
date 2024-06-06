import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';

class AccessService {
  final ApiManager apiManager;

  AccessService({required this.apiManager});

  /// Get the state of the member for feedroom access
  /// Returns the state of the member
  Future<LMResponse<MemberStateResponseEntity>> getMemberState() async {
    try {
      final Response response = await apiManager.client().get(
            apiManager.endPoints.memberStateEndpoint,
          );

      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse<MemberStateResponseEntity>.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }
      return LMResponse<MemberStateResponseEntity>.success(
        data: MemberStateResponseEntity.fromJson(response.data['data']),
      );
    } on DioException catch (e) {
      debugPrint("Error from get member state access: $e");
      return LMResponse<MemberStateResponseEntity>.error(
        errorMessage: e.message ?? 'An error occurred',
      );
    }
  }
}
