import 'api_handler_interface.dart';
import 'api_handler_services.dart';
import 'base_response_api.dart';
import 'method_rest_api.dart';

class ApiHandlerHelper implements ApiHandlerInterface {
  late final String baseUrl;
  late final ApiHandlerServices apiHandlerServices;
  ApiHandlerHelper(this.baseUrl) {
    apiHandlerServices = ApiHandlerServices.instance;
  }

  @override
  Future<BaseResponseApi> apiCall({
    required String endPoint,
    required MethodRestApi methodRestApi,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? bodyData,
  }) {
    var generalHeader = {
      "Content-Type": "application/json",
    };

    if (headers != null) {
      generalHeader.addAll(headers);
    }

    return apiHandlerServices.apiCall(
      baseUrl: baseUrl,
      endPoint: endPoint,
      methodRestApi: methodRestApi,
      bodyData: bodyData,
      headers: generalHeader,
      queryParameter: queryParameter,
    );
  }

  @override
  Future<BaseResponseApi> apiCallFormDataMultipart(
      {required String endPoint,
      required MethodRestApi methodRestApi,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameter,
      Map<String, String>? bodyData}) {
    var generalHeader = {
      "Content-Type": "application/json",
    };

    if (headers != null) {
      generalHeader.addAll(headers);
    }

    return apiHandlerServices.apiCallFormDataMultipart(
      baseUrl: baseUrl,
      endPoint: endPoint,
      methodRestApi: methodRestApi,
      bodyData: bodyData,
      headers: generalHeader,
      queryParameter: queryParameter,
    );
  }
}
