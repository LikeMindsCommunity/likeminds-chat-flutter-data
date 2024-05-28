import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/explore_repository.dart';

class ExploreApi {
  final ExploreRepository exploreRepository;

  ExploreApi({required this.exploreRepository});

  Future<LMResponse<GetExploreFeedResponse>> getExploreFeed(
      GetExploreFeedRequest request) async {
    return await exploreRepository.getExploreFeed(request);
  }

  Future<LMResponse<GetExploreTabCountResponse>> getExploreTabCount() async {
    return await exploreRepository.getExploreTabCount();
  }
}
