import 'package:shared_library/equatable/equatable.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SubmittingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String error;
  const ErrorLoginState(this.error);
}
