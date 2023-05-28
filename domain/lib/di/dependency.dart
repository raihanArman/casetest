import 'package:domain/usecase/login_usecase.dart';
import 'package:shared_library/di/di.dart';

class DomainDependency {
  DomainDependency() {
    _useCase();
  }

  void _useCase() {
    locator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        repository: locator(),
      ),
    );
  }
}
