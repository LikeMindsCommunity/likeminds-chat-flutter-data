import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/dm_repository.dart';

class DMApi {
  final DMRepository dmRepository;

  DMApi({required this.dmRepository});

  Future<LMResponse<CheckDMTabResponse>> checkDMTab() async {
    final response = await dmRepository.checkDMTab();
    return LMResponse<CheckDMTabResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<FetchDMFeedResponse>> fetchDMFeed(
      FetchDMFeedRequest fetchDMFeedRequest) async {
    final response = await dmRepository.fetchDMFeed(fetchDMFeedRequest);
    return LMResponse<FetchDMFeedResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }

  Future<LMResponse<CheckDMStatusResponse>> checkDMStatus(
      CheckDMStatusRequest checkDMStatusRequest) async {
    final response = await dmRepository.checkDMStatus(checkDMStatusRequest);
    return LMResponse<CheckDMStatusResponse>(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response,
    );
  }
}
