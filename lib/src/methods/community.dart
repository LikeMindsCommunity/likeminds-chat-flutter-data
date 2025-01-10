import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/community_repository.dart';

class CommunityApi {
  final CommunityRepository communityRepository;

  CommunityApi({
    required this.communityRepository,
  });

  Future<LMResponse<GetCommunityConfigurationsResponse>>
      getCommunityConfigurations() async {
    return communityRepository.getCommunityConfigurations();
  }
}
