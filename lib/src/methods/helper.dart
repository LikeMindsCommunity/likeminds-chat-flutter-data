import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/helper_repository.dart';

/// HelperApi class is responsible for handling all the helper related API calls
class HelperApi {
  final HelperRepository helperRepository;

  HelperApi({required this.helperRepository});

  Future<LMResponse<TagResponseModel>> getTags({
    required TagRequestModel request,
  }) async {
    return await helperRepository.getTags(request: request);
  }

  Future<LMResponse<DecodeUrlResponse>> decodeUrl({
    required DecodeUrlRequest request,
  }) async {
    return await helperRepository.decodeUrl(request: request);
  }

  void routeProfilePage(String userId) {
    helperRepository.routeProfilePage(userId);
  }
}
