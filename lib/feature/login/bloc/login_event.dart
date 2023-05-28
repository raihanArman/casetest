import 'package:shared_library/equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SubmittingLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const SubmittingLoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
