import 'dart:convert';

import 'package:shared_library/failure/error_body_response.dart';

class ErrorResponse {
  ErrorBodyResponse body;

  ErrorResponse({
    required this.body,
  });

  factory ErrorResponse.fromMap(Map<String, dynamic> data) => ErrorResponse(
        body: ErrorBodyResponse(
          error: data['error'],
        ),
      );

  factory ErrorResponse.fromJson(String source) =>
      ErrorResponse.fromMap(json.decode(source));
}
