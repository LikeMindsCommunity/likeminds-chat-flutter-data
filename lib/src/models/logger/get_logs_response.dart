import 'package:likeminds_chat_fl/src/models/logger/log.dart';

class GetLogResponse {
  List<LMLogBuilder> lmLogsBuilder;

  GetLogResponse._({required this.lmLogsBuilder});
}

class GetLogResponseBuilder {
  List<LMLogBuilder>? _lmLogsBuilder;

  void lmLogsBuilder(List<LMLogBuilder> lmLogsBuilder) {
    _lmLogsBuilder = lmLogsBuilder;
  }

  GetLogResponse build() {
    return GetLogResponse._(lmLogsBuilder: _lmLogsBuilder!);
  }
}
