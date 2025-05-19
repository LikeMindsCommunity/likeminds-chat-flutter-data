import 'package:likeminds_chat_fl/src/models/logger/log.dart';

class LMInitiateLoggerRequest {
  final bool shareLogsWithLM;
  final void Function(Exception, StackTrace) onErrorHandler;
  final LMSeverity logLevel;

  LMInitiateLoggerRequest._({
    required this.shareLogsWithLM,
    required this.onErrorHandler,
    required this.logLevel,
  });
}

class LMInitiateLoggerRequestBuilder {
  bool? _shareLogsWithLM;
  void Function(Exception, StackTrace)? _onErrorHandler;
  LMSeverity? _logLevel;

  void shareLogsWithLM(bool value) {
    _shareLogsWithLM = value;
  }

  void onErrorHandler(void Function(Exception, StackTrace) handler) {
    _onErrorHandler = handler;
  }

  void logLevel(LMSeverity level) {
    _logLevel = level;
  }

  LMInitiateLoggerRequest build() {
    if (_shareLogsWithLM == null) {
      throw Exception("shareLogsWithLM is required");
    }
    if (_onErrorHandler == null) {
      throw Exception("onErrorHandler is required");
    }
    if (_logLevel == null) {
      throw Exception("logLevel is required");
    }

    return LMInitiateLoggerRequest._(
      shareLogsWithLM: _shareLogsWithLM!,
      onErrorHandler: _onErrorHandler!,
      logLevel: _logLevel!,
    );
  }
}
