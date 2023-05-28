import 'dart:convert';

import 'package:data/response/login_body_response.dart';

class LoginResponse {
  LoginBodyResponse? body;
  String? errorMessage;

  LoginResponse({this.body, this.errorMessage});

  factory LoginResponse.fromMap(Map<String, dynamic> data) => LoginResponse(
        body: LoginBodyResponse(
          token: data['token'],
        ),
      );

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));
}
