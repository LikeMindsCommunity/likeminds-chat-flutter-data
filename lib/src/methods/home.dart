import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/home_feed_repository.dart';

class HomeApi {
  HomeApi({
    required this.homeRepository,
  });

  final HomeFeedRepository homeRepository;

  Future<LMResponse<GetHomeFeedResponse>> getHomeFeed(
    GetHomeFeedRequest request,
  ) async {
    return await homeRepository.getHomeFeed(request);
  }
}
