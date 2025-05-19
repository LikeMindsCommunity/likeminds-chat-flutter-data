class LMStackTrace {
  final String exception;
  final String trace;

  LMStackTrace._({required this.exception, required this.trace});

  Map<String, dynamic> toJson() => {
        'exception': exception,
        'trace': trace,
      };
}

class LMStackTraceBuilder {
  String? _exception;
  String? _trace;

  void exception(String exception) {
    _exception = exception;
  }

  void trace(String trace) {
    _trace = trace;
  }

  LMStackTrace build() {
    if (_exception == null) {
      throw Exception("Exception is required for LMStackTrace");
    }
    if (_trace == null) {
      throw Exception("Trace is required for LMStackTrace");
    }

    return LMStackTrace._(exception: _exception!, trace: _trace!);
  }
}
