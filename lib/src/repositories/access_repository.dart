import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/services/access_service.dart';

class AccessRepository {
  final AccessService accessService;

  AccessRepository({required this.accessService});

  Future<LMResponse<MemberStateResponse>> getMemberState() async {
    final response = await accessService.getMemberState();
    if (!response.success) {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
    return LMResponse.fromData(
      response: response,
      data: MemberStateResponse.fromEntity(response.data!),
    );
  }
}
