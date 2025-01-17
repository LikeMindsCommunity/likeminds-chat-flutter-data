import 'package:likeminds_chat_fl/src/models/community/get_community_configurations_response_model.dart';
import 'package:likeminds_chat_fl/src/models/lm_response_model.dart';
import 'package:likeminds_chat_fl/src/services/community_service.dart';

class CommunityRepository {
  final CommunityService communityService;

  CommunityRepository({required this.communityService});

  Future<LMResponse<GetCommunityConfigurationsResponse>>
      getCommunityConfigurations() async {
    final response = await communityService.getCommunityConfigurations();

    if (response.success == false || response.data == null) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }

    return LMResponse.success(
      data: GetCommunityConfigurationsResponse.fromEntity(response.data!),
    );
  }
}
