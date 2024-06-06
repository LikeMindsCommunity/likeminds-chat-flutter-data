import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/home_feed_service.dart';

class HomeFeedRepository {
  final HomeFeedService homeFeedService;

  HomeFeedRepository({
    required this.homeFeedService,
  });

  Future<LMResponse<GetHomeFeedResponse>> getHomeFeed(
      GetHomeFeedRequest homeFeedRequest) async {
    LMResponse<GetHomeFeedResponseEntity> entity =
        await homeFeedService.getHomeFeed(homeFeedRequest);
    if (!entity.success) {
      return LMResponse.error(errorMessage: entity.errorMessage!);
    }
    GetHomeFeedResponse homeFeedResponse =
        GetHomeFeedResponse.fromEntity(entity.data!);
    return LMResponse.fromData(
      response: entity,
      data: homeFeedResponse,
    );
  }
}
