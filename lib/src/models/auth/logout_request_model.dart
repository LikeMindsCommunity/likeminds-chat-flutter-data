class LogoutRequest {
  final String? deviceId;

  LogoutRequest._({
    required this.deviceId,
  });
}

class LogoutRequestBuilder {
  String? _deviceId;

  void deviceId(String deviceId) {
    _deviceId = deviceId;
  }

  LogoutRequest build() {
    return LogoutRequest._(
      deviceId: _deviceId,
    );
  }
}
