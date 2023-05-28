import 'package:data/datasource/remote/login_data_source.dart';
import 'package:domain/repository/login_repository.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:data/repository/login_repository.dart';
import 'package:shared_library/di/di.dart';

class DataDependency {
  DataDependency() {
    _dataSource();
    _repository();
  }

  void _dataSource() {
    locator.registerLazySingleton<LoginDataSource>(
      () => LoginDataSource(
        apiHelper: locator(),
      ),
    );
  }

  void _repository() => locator.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(
          loginDataSource: locator(),
        ),
      );
}
