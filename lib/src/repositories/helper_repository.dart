import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/helper_service.dart';

class HelperRepository {
  final HelperService helperService;

  HelperRepository({required this.helperService});

  Future<LMResponse<TagResponseModel>> getTags({
    required TagRequestModel request,
  }) async {
    final response = await helperService.getTags(request: request);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    } else {
      return LMResponse.fromData(
        response: response,
        data: TagResponseModel.fromEntity(response.data!),
      );
    }
  }

  Future<LMResponse<DecodeUrlResponse>> decodeUrl({
    required DecodeUrlRequest request,
  }) async {
    final response = await helperService.decodeUrl(request: request);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    } else {
      return LMResponse.fromData(
        response: response,
        data: DecodeUrlResponse.fromEntity(response.data!),
      );
    }
  }

  void routeProfilePage(String userId) {
    helperService.routeProfilePage(userId);
  }
}
