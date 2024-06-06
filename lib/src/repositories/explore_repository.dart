import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/explore_service.dart';

class ExploreRepository {
  final ExploreService exploreService;

  ExploreRepository({required this.exploreService});

  Future<LMResponse<GetExploreFeedResponse>> getExploreFeed(
      GetExploreFeedRequest request) async {
    LMResponse<GetExploreFeedResponseEntity> responseEntity =
        await exploreService.getExploreFeed(request);
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: GetExploreFeedResponse.fromEntity(responseEntity.data!),
    );
  }

  Future<LMResponse<GetExploreTabCountResponse>> getExploreTabCount() async {
    LMResponse<GetExploreTabCountResponseEntity> responseEntity =
        await exploreService.getExploreTabCount();
    if (!responseEntity.success) {
      return LMResponse.error(errorMessage: responseEntity.errorMessage!);
    }
    return LMResponse.fromData(
      response: responseEntity,
      data: GetExploreTabCountResponse.fromEntity(responseEntity.data!),
    );
  }
}
