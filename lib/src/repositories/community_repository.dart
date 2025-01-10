import 'package:likeminds_chat_fl/src/models/community/community_configurations_model.dart';
import 'package:likeminds_chat_fl/src/models/lm_response_model.dart';
import 'package:likeminds_chat_fl/src/services/community_service.dart';

class CommunityRepository {
  final CommunityService communityService;

  CommunityRepository({required this.communityService});

  Future<LMResponse<List<CommunityConfigurations>>>
      getCommunityConfigurations() async {
    final response = await communityService.getCommunityConfigurations();
    
    return LMResponse.fromData(
      response: response,
      data: response.data
          ?.map((e) => CommunityConfigurations.fromEntity(e))
          .toList(),
    );
  }
}
