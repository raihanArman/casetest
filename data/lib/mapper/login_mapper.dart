import 'package:data/request/login_request.dart';
import 'package:domain/model/login_model.dart';
import 'package:domain/params/login_params.dart';

class LoginMapper {
  LoginRequest mapToLoginRequest(LoginParams params) =>
      LoginRequest(email: params.email, password: params.password);
}
