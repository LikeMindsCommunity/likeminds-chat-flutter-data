class RegisterDeviceRequest {
  final String token;
  final String deviceId;
  final int memberId;

  RegisterDeviceRequest({
    required this.token,
    required this.deviceId,
    required this.memberId,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'device_id': deviceId,
        'member_id': memberId,
      };
}

class RegisterDeviceRequestBuilder {
  String? _token;
  String? _deviceId;
  int? _memberId;

  void token(String token) {
    _token = token;
  }

  void deviceId(String deviceId) => _deviceId = deviceId;
  void memberId(int memberId) => _memberId = memberId;

  RegisterDeviceRequest build() {
    if (_token == null) {
      throw Exception("Token is required");
    }
    if (_deviceId == null) {
      throw StateError("DeviceId is required");
    }
    if (_memberId == null) {
      throw StateError("MemberId is required");
    }
    return RegisterDeviceRequest(
      token: _token!,
      deviceId: _deviceId!,
      memberId: _memberId!,
    );
  }
}
