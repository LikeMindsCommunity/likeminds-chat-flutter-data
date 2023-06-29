class CheckDMStatusRequest {
  final String reqFrom;

  CheckDMStatusRequest._({
    required this.reqFrom,
  });

  Map<String, dynamic> toJson() {
    return {
      "req_from": reqFrom,
    };
  }
}

class CheckDMStatusRequestBuilder {
  String? _reqFrom;

  void reqFrom(String reqFrom) {
    _reqFrom = reqFrom;
  }

  CheckDMStatusRequest build() {
    if (_reqFrom == null) {
      throw Exception("reqFrom is required");
    }
    return CheckDMStatusRequest._(
      reqFrom: _reqFrom!,
    );
  }
}
