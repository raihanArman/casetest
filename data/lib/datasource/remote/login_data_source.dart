import 'package:data/request/login_request.dart';
import 'package:data/response/login_response.dart';
import 'package:network/api_handler_interface.dart';
import 'package:network/method_rest_api.dart';
import 'package:shared_library/failure/error_response.dart';
import 'package:shared_library/failure/exception.dart';

class LoginDataSource {
  final ApiHandlerInterface apiHelper;

  LoginDataSource({
    required this.apiHelper,
  });

  Future<LoginResponse> postLogin(LoginRequest request) async {
    try {
      final result = await apiHelper.apiCall(
          endPoint: "api/login",
          methodRestApi: MethodRestApi.post,
          bodyData: request.toMap());

      if (result.success && result.data != null) {
        print("Data Source -> ${result.data}");
        LoginResponse dataResult = LoginResponse.fromJson(result.data!);

        return dataResult;
      } else {
        ErrorResponse error = ErrorResponse.fromJson(result.message);
        throw ServerException(error.body.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
