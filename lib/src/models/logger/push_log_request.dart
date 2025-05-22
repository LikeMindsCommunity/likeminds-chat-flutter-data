import 'package:likeminds_chat_fl/src/models/logger/log.dart';

class PushLogRequest {
  final List<LMLog> logs;

  PushLogRequest._({required this.logs});

  Map<String, dynamic> toJson() {
    return {'logs': logs.map((e) => e.toJson()).toList()};
  }
}

class PushLogRequestBuilder {
  List<LMLog>? _logs = [];

  void logs(List<LMLog> logList) {
    _logs = logList;
  }

  PushLogRequest build() {
    if (_logs == null || _logs!.isEmpty) {
      throw Exception("Logs cannot be null or empty");
    }

    return PushLogRequest._(logs: _logs!);
  }
}
