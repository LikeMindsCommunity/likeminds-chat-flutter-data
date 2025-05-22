class LMSDKMeta {
  final String? dataLayerVersion;
  final String? coreVersion;

  LMSDKMeta._({this.dataLayerVersion, this.coreVersion});

  Map<String, dynamic> toJson() => {
        'data_layer_version': dataLayerVersion,
        'core_version': coreVersion,
      };
}

class LMSDKMetaBuilder {
  String? _dataLayerVersion;
  String? _coreVersion;

  void dataLayerVersion(String version) {
    _dataLayerVersion = version;
  }

  void coreVersion(String version) {
    _coreVersion = version;
  }

  LMSDKMeta build() {
    return LMSDKMeta._(
      dataLayerVersion: _dataLayerVersion,
      coreVersion: _coreVersion,
    );
  }
}
