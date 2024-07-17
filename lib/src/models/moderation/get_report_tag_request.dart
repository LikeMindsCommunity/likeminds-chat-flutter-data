class GetReportTagRequest {
  final int _type;

  int get type => _type;

  GetReportTagRequest._({required int type}) : _type = type;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }
}

class GetReportTagRequestBuilder {
  int? _type;

  void type(int? type) => _type = type;

  GetReportTagRequest build() {
    if (_type == null) {
      throw StateError('GetDeleteReasonRequestBuilder must set type');
    }
    return GetReportTagRequest._(type: _type!);
  }
}
