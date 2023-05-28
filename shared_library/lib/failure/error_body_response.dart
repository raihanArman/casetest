class ErrorBodyResponse {
  ErrorBodyResponse({
    required this.error,
  });

  String error;

  factory ErrorBodyResponse.fromMap(Map<String, dynamic> map) {
    return ErrorBodyResponse(
      error: map['error'],
    );
  }
}
