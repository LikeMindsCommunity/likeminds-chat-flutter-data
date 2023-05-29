import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/services/access_service.dart';

class AccessRepository {
  final AccessService accessService;

  AccessRepository({required this.accessService});

  // Future<bool> getAccess(String accesType) async {
  //   return await accessService.getAccess(accesType);
  // }

  Future<MemberStateResponse> getMemberState() async {
    final response = await accessService.getMemberState();
    return MemberStateResponse.fromEntity(response);
  }
}
