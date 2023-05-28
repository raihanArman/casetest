class BaseResponseApi {
  BaseResponseApi({
    this.data,
    required this.success,
    required this.message,
    required this.statusCode,
  });

  String? data;
  bool success;
  String message;
  int statusCode;
}
