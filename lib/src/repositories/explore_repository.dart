import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/explore_service.dart';

class ExploreRepository {
  final ExploreService exploreService;

  ExploreRepository({required this.exploreService});

  Future<GetExploreFeedResponse> getExploreFeed(
      GetExploreFeedRequest request) async {
    GetExploreFeedResponseEntity responseEntity =
        await exploreService.getExploreFeed(request);
    return GetExploreFeedResponse.fromEntity(responseEntity);
  }

  Future<GetExploreTabCountResponse> getExploreTabCount() async {
    GetExploreTabCountResponseEntity responseEntity =
        await exploreService.getExploreTabCount();
    return GetExploreTabCountResponse.fromEntity(responseEntity);
  }
}
