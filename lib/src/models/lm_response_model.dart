class LMResponse<T> {
  final bool success;
  final String? errorMessage;
  final T? data;

  LMResponse({
    required this.success,
    this.errorMessage,
    this.data,
  });

  factory LMResponse.tryIt({
    required T Function(T entity) function,
    LMResponse? response,
  }) {
    try {
      return LMResponse.success(data: function(response!.data!));
    } catch (e) {
      return LMResponse.error(errorMessage: e.toString());
    }
  }

  factory LMResponse.fromData({required LMResponse response, T? data}) {
    if (response.success && data != null) {
      return LMResponse.success(data: data);
    } else {
      return LMResponse.error(errorMessage: response.errorMessage!);
    }
  }

  factory LMResponse.copy({required LMResponse response}) {
    return LMResponse(
      success: response.success,
      errorMessage: response.errorMessage,
      data: response.data,
    );
  }

  factory LMResponse.success({required T data}) {
    return LMResponse(
      success: true,
      data: data,
    );
  }
  factory LMResponse.error({required String errorMessage}) {
    return LMResponse(
      success: false,
      errorMessage: errorMessage,
    );
  }
}
