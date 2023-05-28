import 'package:data/di/dependency.dart';
import 'package:domain/di/dependency.dart';
import 'package:network/di/dependency.dart';

class Dependency {
  void initDependency() {
    _registerData();
    _registerDomain();
    _registerSharedLibrary();
  }

  void _registerData() => DataDependency();
  void _registerDomain() => DomainDependency();

  void _registerSharedLibrary() {
    NetworkDependency("https://reqres.in/");
  }
}
