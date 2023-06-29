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
}
