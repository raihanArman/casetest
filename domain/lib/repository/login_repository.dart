import 'package:domain/model/login_model.dart';
import 'package:domain/params/login_params.dart';
import 'package:shared_library/dartz/dartz.dart';
import 'package:shared_library/failure/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> postLogin(LoginParams request);
}
