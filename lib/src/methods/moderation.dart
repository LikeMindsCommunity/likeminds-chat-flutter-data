import 'package:likeminds_chat_fl/src/models/models.dart';
import 'package:likeminds_chat_fl/src/repositories/moderation_repository.dart';

class ModerationApi {
  final ModerationRepository moderationRepository;
  ModerationApi({
    required this.moderationRepository,
  });

  Future<LMResponse<GetReportTagResponse>> getReportTags(
      GetReportTagRequest request) async {
    return await moderationRepository.getReportTags(request);
  }

  Future<LMResponse<void>> postReport(PostReportRequest request) async {
    return await moderationRepository.postReport(request);
  }
}
