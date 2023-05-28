import 'package:network/api_handler_helper.dart';
import 'package:network/api_handler_interface.dart';
import 'package:shared_library/di/di.dart';

class NetworkDependency {
  NetworkDependency(String baseUrl) {
    _registerApiHelper(baseUrl);
  }

  void _registerApiHelper(String baseUrl) =>
      locator.registerLazySingleton<ApiHandlerInterface>(
        () => ApiHandlerHelper(baseUrl),
      );
}
