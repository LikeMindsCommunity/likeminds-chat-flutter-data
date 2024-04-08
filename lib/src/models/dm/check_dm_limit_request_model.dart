class CheckDMLimitRequest {
  String uuid;

  CheckDMLimitRequest._({required this.uuid});

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
      };
}

class CheckDmLimitRequestBuilder {
  CheckDmLimitRequestBuilder();
  String? _uuid;

  void uuid(String uuid) => _uuid = uuid;

  CheckDMLimitRequest build() {
    if (_uuid == null) {
      throw StateError("uuid is required");
    }

    return CheckDMLimitRequest._(
      uuid: _uuid!,
    );
  }
}
