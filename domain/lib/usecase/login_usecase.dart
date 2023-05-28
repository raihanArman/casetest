import 'package:domain/model/login_model.dart';
import 'package:domain/params/login_params.dart';
import 'package:domain/repository/login_repository.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';
import 'package:shared_library/dartz/dartz.dart';

class LoginUseCase extends UseCase<LoginModel?, LoginParams> {
  final LoginRepository repository;

  LoginUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, LoginModel>> call(LoginParams params) async =>
      repository.postLogin(params);
}
