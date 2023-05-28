class LoginBodyResponse {
  LoginBodyResponse({
    required this.token,
  });

  String token;

  factory LoginBodyResponse.fromMap(Map<String, dynamic> map) {
    return LoginBodyResponse(
      token: map['token'],
    );
  }
}
