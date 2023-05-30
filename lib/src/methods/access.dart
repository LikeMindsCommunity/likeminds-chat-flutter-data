import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/access_repository.dart';

class AccessApi {
  final AccessRepository accessRepository;

  AccessApi({required this.accessRepository});

  Future<LMResponse<MemberStateResponse>> getMemberState() async {
    MemberStateResponse response = await accessRepository.getMemberState();
    return LMResponse<MemberStateResponse>(
      data: response,
      success: response.success,
      errorMessage: response.errorMessage,
    );
  }
}
