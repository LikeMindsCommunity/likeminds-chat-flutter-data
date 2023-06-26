import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/explore_repository.dart';

class ExploreApi {
  final ExploreRepository exploreRepository;

  ExploreApi({required this.exploreRepository});

  Future<LMResponse<GetExploreFeedResponse>> getExploreFeed(
      GetExploreFeedRequest request) async {
    GetExploreFeedResponse response =
        await exploreRepository.getExploreFeed(request);
    return LMResponse<GetExploreFeedResponse>(
      success: true,
      data: response,
    );
  }

  Future<LMResponse<GetExploreTabCountResponse>> getExploreTabCount() async {
    GetExploreTabCountResponse response =
        await exploreRepository.getExploreTabCount();
    return LMResponse<GetExploreTabCountResponse>(
      success: true,
      data: response,
    );
  }
}
