import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';
import 'package:likeminds_chat_fl/src/repositories/logger_repository.dart';

class LoggerApi {
  final LoggerRepository loggerRepository;

  LoggerApi({required this.loggerRepository});

  Future<LMResponse<void>> pushLogs({
    required PushLogRequest request,
  }) async {
    return await loggerRepository.pushLogs(request: request);
  }
}
