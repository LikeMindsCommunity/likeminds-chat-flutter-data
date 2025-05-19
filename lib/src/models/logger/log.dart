import 'package:likeminds_chat_fl/src/models/logger/device_details.dart';
import 'package:likeminds_chat_fl/src/models/logger/sdk_meta.dart';
import 'package:likeminds_chat_fl/src/models/logger/stack_trace.dart';

class LMLog {
  final int timestamp;
  final LMDeviceDetails deviceMeta;
  final LMStackTrace stackTrace;
  final LMSDKMeta? sdkMeta;
  final LMSeverity? severity;

  LMLog._({
    required this.timestamp,
    required this.deviceMeta,
    required this.stackTrace,
    this.sdkMeta,
    this.severity,
  });

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'device_meta': deviceMeta.toJson(),
        'stack_trace': stackTrace.toJson(),
        if (sdkMeta != null) 'sdk_meta': sdkMeta!.toJson(),
        if (severity != null) 'severity': severity!.toJson(),
      };
}

class LMLogBuilder {
  int? _timestamp;
  LMDeviceDetails? _deviceMeta;
  LMStackTrace? _stackTrace;
  LMSDKMeta? _sdkMeta;
  LMSeverity? _severity;

  void timestamp(int timestamp) {
    _timestamp = timestamp;
  }

  void deviceMeta(LMDeviceDetails deviceMeta) {
    _deviceMeta = deviceMeta;
  }

  void stackTrace(LMStackTrace stackTrace) {
    _stackTrace = stackTrace;
  }

  void sdkMeta(LMSDKMeta sdkMeta) {
    _sdkMeta = sdkMeta;
  }

  void severity(LMSeverity severity) {
    _severity = severity;
  }

  LMLog build() {
    if (_timestamp == null) {
      throw Exception("timestamp is required for LMLog");
    }
    if (_deviceMeta == null) {
      throw Exception("deviceMeta is required for LMLog");
    }
    if (_stackTrace == null) {
      throw Exception("stackTrace is required for LMLog");
    }

    return LMLog._(
      timestamp: _timestamp!,
      deviceMeta: _deviceMeta!,
      stackTrace: _stackTrace!,
      sdkMeta: _sdkMeta,
      severity: _severity,
    );
  }
}

enum LMSeverity {
  INFO,
  DEBUG,
  NOTICE,
  WARNING,
  ERROR,
  CRITICAL,
  ALERT,
  EMERGENCY,
  DEFAULT
}

extension LMSeverityExtension on LMSeverity {
  String toJson() => toString().split('.').last;

  static LMSeverity fromJson(String value) {
    return LMSeverity.values.firstWhere(
      (e) => e.toString().split('.').last == value,
      orElse: () => LMSeverity.DEFAULT,
    );
  }
}
