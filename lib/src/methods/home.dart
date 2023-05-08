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
    GetHomeFeedResponse response = await homeRepository.getHomeFeed(request);
    return LMResponse<GetHomeFeedResponse>(
      data: response,
      success: response.success,
      errorMessage: response.errorMessage,
    );
  }
}
