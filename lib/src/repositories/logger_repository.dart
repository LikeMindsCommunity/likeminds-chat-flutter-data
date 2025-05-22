import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/services/logger_service.dart';

class LoggerRepository {
  final LoggerService loggerService;

  LoggerRepository({required this.loggerService});

  Future<LMResponse<void>> pushLogs({required PushLogRequest request}) async {
    LMResponse pushLogResponseEntity =
        await loggerService.pushLogs(request: request);

    return pushLogResponseEntity;
  }
}
