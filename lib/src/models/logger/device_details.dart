class LMDeviceDetails {
  final String versionOs;
  final String deviceName;
  final int screenHeight;
  final int screenWidth;
  final bool wifi;

  LMDeviceDetails._({
    required this.versionOs,
    required this.deviceName,
    required this.screenHeight,
    required this.screenWidth,
    required this.wifi,
  });

  Map<String, dynamic> toJson() => {
        'version_os': versionOs,
        'device_name': deviceName,
        'screen_height': screenHeight,
        'screen_width': screenWidth,
        'wifi': wifi,
      };
}

class LMDeviceDetailsBuilder {
  String? _versionOs;
  String? _deviceName;
  int? _screenHeight;
  int? _screenWidth;
  bool? _wifi;

  void versionOS(String versionOs) {
    _versionOs = versionOs;
  }

  void deviceName(String deviceName) {
    _deviceName = deviceName;
  }

  void screenHeight(int screenHeight) {
    _screenHeight = screenHeight;
  }

  void screenWidth(int screenWidth) {
    _screenWidth = screenWidth;
  }

  void wifi(bool wifi) {
    _wifi = wifi;
  }

  LMDeviceDetails build() {
    if (_versionOs == null) {
      throw Exception("versionOs is required for LMDeviceDetails");
    }
    if (_deviceName == null) {
      throw Exception("deviceName is required for LMDeviceDetails");
    }
    if (_screenHeight == null) {
      throw Exception("screenHeight is required for LMDeviceDetails");
    }
    if (_screenWidth == null) {
      throw Exception("screenWidth is required for LMDeviceDetails");
    }
    if (_wifi == null) {
      throw Exception("wifi is required for LMDeviceDetails");
    }

    return LMDeviceDetails._(
      versionOs: _versionOs!,
      deviceName: _deviceName!,
      screenHeight: _screenHeight!,
      screenWidth: _screenWidth!,
      wifi: _wifi!,
    );
  }
}
