import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/helper_repository.dart';

class HelperApi {
  final HelperRepository helperRepository;

  HelperApi({required this.helperRepository});

  Future<LMResponse<TagResponseModel>> getTags({
    required TagRequestModel request,
  }) async {
    final response = await helperRepository.getTags(request: request);
    return LMResponse(success: response.success, data: response);
  }

  Future<LMResponse<DecodeUrlResponse>> decodeUrl({
    required DecodeUrlRequest request,
  }) async {
    final response = await helperRepository.decodeUrl(request: request);
    return LMResponse(success: response.success, data: response);
  }

  void routeProfilePage(String userId) {
    helperRepository.routeProfilePage(userId);
  }
}
