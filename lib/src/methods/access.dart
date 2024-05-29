import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/access_repository.dart';

/// AccessApi class is responsible for handling all the access related API calls
class AccessApi {
  final AccessRepository accessRepository;

  AccessApi({required this.accessRepository});

  Future<LMResponse<MemberStateResponse>> getMemberState() async {
    return await accessRepository.getMemberState();
  }
}
