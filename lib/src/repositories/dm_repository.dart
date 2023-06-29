import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/dm_service.dart';

class DMRepository {
  final DMService dmService;

  DMRepository({
    required this.dmService,
  });

  Future<CheckDMTabResponse> checkDMTab() async {
    final response = await dmService.checkDMTab();
    return CheckDMTabResponse.fromEntity(response);
  }

  // Future<FetchDMFeedResponseEntity> fetchDMFeed(
  // FetchDMFeedRequest fetchDMFeedRequest)

  Future<FetchDMFeedResponse> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    final response = await dmService.fetchDMFeed(fetchDMFeedRequest);
    return FetchDMFeedResponse.fromEntity(response);
  }
}
