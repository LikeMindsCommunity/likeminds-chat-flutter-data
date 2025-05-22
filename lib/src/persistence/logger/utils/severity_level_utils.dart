import 'package:likeminds_chat_fl/likeminds_chat_fl.dart';

Map<LMSeverity, int> LMSeverityLevels = {
  LMSeverity.INFO: 100,
  LMSeverity.DEBUG: 200,
  LMSeverity.NOTICE: 300,
  LMSeverity.WARNING: 400,
  LMSeverity.ERROR: 500,
  LMSeverity.CRITICAL: 600,
  LMSeverity.ALERT: 700,
  LMSeverity.EMERGENCY: 800,
  LMSeverity.DEFAULT: 0,
};

// Returns true if the LMSeverity of the error is greater than or equal to the
// the log level set by the LMFeedClient
// [errorLMSeverity] is the LMSeverity of the error
// [logLevel] is the log level set by the LMFeedClient
bool checkLMSeverityForLoggingErros(
    {required LMSeverity errorLMSeverity, required LMSeverity logLevel}) {
  return LMSeverityLevels[errorLMSeverity]! >= LMSeverityLevels[logLevel]!;
}

Map<LMSeverity, String> severityMap = {
  LMSeverity.DEBUG: 'debug',
  LMSeverity.INFO: 'info',
  LMSeverity.NOTICE: 'notice',
  LMSeverity.WARNING: 'warning',
  LMSeverity.ERROR: 'error',
  LMSeverity.CRITICAL: 'critical',
  LMSeverity.ALERT: 'alert',
  LMSeverity.EMERGENCY: 'emergency',
  LMSeverity.DEFAULT: 'default',
};

LMSeverity getSeverityFromString(String severity) {
  switch (severity) {
    case 'debug':
      return LMSeverity.DEBUG;
    case 'info':
      return LMSeverity.INFO;
    case 'notice':
      return LMSeverity.NOTICE;
    case 'warning':
      return LMSeverity.WARNING;
    case 'error':
      return LMSeverity.ERROR;
    case 'critical':
      return LMSeverity.CRITICAL;
    case 'alert':
      return LMSeverity.ALERT;
    case 'emergency':
      return LMSeverity.EMERGENCY;
    default:
      return LMSeverity.DEFAULT;
  }
}
