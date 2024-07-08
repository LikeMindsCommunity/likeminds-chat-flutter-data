import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/services/moderation_service.dart';

class ModerationRepository {
  final ModerationService moderationService;
  ModerationRepository({
    required this.moderationService,
  });

  Future<LMResponse<GetReportTagResponse>> getReportTags(
      GetReportTagRequest request) async {
    final response = await moderationService.getReportTags(request);
    if (!response.success || response.data == null) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: GetReportTagResponse.fromEntity(response.data!),
    );
  }

  Future<LMResponse<void>> postReport(PostReportRequest request) async {
    final response = await moderationService.postReport(request);
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.success(data: null);
  }
}
