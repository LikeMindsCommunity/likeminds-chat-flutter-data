import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/community/get_community_configurations_response_model.dart';
import 'package:likeminds_chat_fl/src/models/lm_response_model.dart';

abstract class ICommunityService {
  Future<LMResponse<GetCommunityConfigurationsResponseEntity>>
      getCommunityConfigurations();
}

class CommunityService implements ICommunityService {
  /// API manager instance, helps in making API calls
  final ApiManager apiManager;

  CommunityService({required this.apiManager});

  @override
  Future<LMResponse<GetCommunityConfigurationsResponseEntity>>
      getCommunityConfigurations() async {
    try {
      // Call API to get community configurations
      // Parse response and return
      final response = await apiManager.client().get(
            apiManager.endPoints.communityConfigurationsEndpoint,
          );
      // Check if response is not successful or data is null
      // Return error response
      if (!response.data['success'] || response.data['data'] == null) {
        return LMResponse.error(
          errorMessage: response.data['error_message'] ?? 'An error occurred',
        );
      }

      // Parse response data to list of community configurations
      // and return success response

      return LMResponse.success(
          data: GetCommunityConfigurationsResponseEntity.fromJson(
              response.data['data']));
    } on DioException catch (error) {
      // Handle error
      debugPrint("Error from get member state access: $error");
      return LMResponse.error(
        errorMessage:
            error.message ?? 'Error in fetching community configurations',
      );
    }
  }
}
