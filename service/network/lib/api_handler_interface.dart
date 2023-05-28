import 'base_response_api.dart';
import 'method_rest_api.dart';

abstract class ApiHandlerInterface {
  Future<BaseResponseApi> apiCall({
    required String endPoint,
    required MethodRestApi methodRestApi,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? bodyData,
  });

  Future<BaseResponseApi> apiCallFormDataMultipart({
    required String endPoint,
    required MethodRestApi methodRestApi,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameter,
    Map<String, String>? bodyData,
  });
}
