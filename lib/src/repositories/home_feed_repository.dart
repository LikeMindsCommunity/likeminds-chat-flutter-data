import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/home_feed_service.dart';

class HomeFeedRepository {
  final HomeFeedService homeFeedService;

  HomeFeedRepository({
    required this.homeFeedService,
  });

  Future<GetHomeFeedResponse> getHomeFeed(
      GetHomeFeedRequest homeFeedRequest) async {
    GetHomeFeedResponseEntity entity =
        await homeFeedService.getHomeFeed(homeFeedRequest);
    GetHomeFeedResponse homeFeedResponse =
        GetHomeFeedResponse.fromEntity(entity);
    return homeFeedResponse;
  }
}
