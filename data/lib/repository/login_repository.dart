import 'dart:io';

import 'package:data/datasource/remote/login_data_source.dart';
import 'package:data/mapper/login_mapper.dart';
import 'package:data/request/login_request.dart';
import 'package:data/response/login_response.dart';
import 'package:domain/model/login_model.dart';
import 'package:domain/params/login_params.dart';
import 'package:domain/repository/login_repository.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/failure/exception.dart';
import 'package:shared_library/dartz/dartz.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({
    required this.loginDataSource,
  });

  @override
  Future<Either<Failure, LoginModel>> postLogin(LoginParams request) async {
    try {
      final result = await loginDataSource
          .postLogin(LoginMapper().mapToLoginRequest(request));

      print("Repository -> ${result.body}");

      final loginModel = LoginModel(
          isSuccessfully: result.body != null,
          errorMessage: result.errorMessage);

      return Right(loginModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          "",
        ),
      );
    }
  }
}
