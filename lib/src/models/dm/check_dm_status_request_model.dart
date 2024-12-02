class CheckDMStatusRequest {
  final String reqFrom;

  final String? uuid;

  CheckDMStatusRequest._({
    required this.reqFrom,
    this.uuid,
  });

  Map<String, dynamic> toJson() {
    return {
      "req_from": reqFrom,
      "uuid": uuid,
    };
  }
}

class CheckDMStatusRequestBuilder {
  String? _reqFrom;
  String? _uuid;

  void reqFrom(String reqFrom) {
    _reqFrom = reqFrom;
  }

  void uuid(String uuid) {
    _uuid = uuid;
  }

  CheckDMStatusRequest build() {
    if (_reqFrom == null) {
      throw Exception("reqFrom is required");
    }
    return CheckDMStatusRequest._(
      reqFrom: _reqFrom!,
      uuid: _uuid,
    );
  }
}
