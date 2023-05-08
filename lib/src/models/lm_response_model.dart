class LMResponse<T> {
  final bool success;
  final String? errorMessage;
  final T? data;

  LMResponse({
    required this.success,
    this.errorMessage,
    this.data,
  });
}
