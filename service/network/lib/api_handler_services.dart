import 'dart:io';

import 'package:http/http.dart';

import 'base_response_api.dart';
import 'method_rest_api.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiHandlerServices {
  static ApiHandlerServices? _instance;

  ApiHandlerServices._();
  static ApiHandlerServices get instance =>
      _instance ??= ApiHandlerServices._();

  String get _hostCheckConnection => 'google.com';
  Duration get _timeoutDuration => const Duration(seconds: 10);

  Future<BaseResponseApi> apiCall({
    required String baseUrl,
    required String endPoint,
    required MethodRestApi methodRestApi,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? bodyData,
  }) async {
    try {
      List<InternetAddress> checkConnectivity =
          await InternetAddress.lookup(_hostCheckConnection);
      if (checkConnectivity.isNotEmpty) {
        final String fullPathUri = baseUrl +
            endPoint +
            (queryParameter != null ? '?$queryParameter' : '');
        if (kDebugMode) {
          _printFullUri(fullPathUri, methodRestApi, bodyData);
        }
        try {
          switch (methodRestApi) {
            case MethodRestApi.get:
              return _handlingResponse(
                await http
                    .get(
                      Uri.parse(fullPathUri),
                      headers: headers,
                    )
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.post:
              return _handlingResponse(
                await http
                    .post(
                      Uri.parse(fullPathUri),
                      body: json.encode(bodyData),
                      headers: headers,
                    )
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.patch:
              return _handlingResponse(
                await http
                    .patch(
                      Uri.parse(fullPathUri),
                      body: json.encode(bodyData),
                      headers: headers,
                    )
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.put:
              return _handlingResponse(
                await http
                    .put(
                      Uri.parse(fullPathUri),
                      body: json.encode(bodyData),
                      headers: headers,
                    )
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.delete:
              return _handlingResponse(
                await http
                    .delete(
                      Uri.parse(fullPathUri),
                      body: json.encode(bodyData),
                      headers: headers,
                    )
                    .timeout(_timeoutDuration),
              );
            default:
              return BaseResponseApi(
                success: false,
                message: 'Request Time Out',
                statusCode: 408,
              );
          }
        } on TimeoutException catch (exception, _) {
          return BaseResponseApi(
            success: false,
            message: 'Request Time Out',
            statusCode: 408,
          );
        } catch (_) {
          return BaseResponseApi(
            success: false,
            message: 'Sorry There is something wrong',
            statusCode: 404,
          );
        }
      } else {
        return BaseResponseApi(
          success: false,
          message: 'There is Problem on Internet Connection',
          statusCode: 777,
        );
      }
    } on SocketException catch (_) {
      return BaseResponseApi(
        success: false,
        message: 'There is Problem on Internet Connection',
        statusCode: 777,
      );
    } catch (_) {
      return BaseResponseApi(
        success: false,
        message: 'Sorry There is something wrong',
        statusCode: 404,
      );
    }
  }

  Future<BaseResponseApi> apiCallFormDataMultipart({
    required String baseUrl,
    required String endPoint,
    required MethodRestApi methodRestApi,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameter,
    Map<String, String>? bodyData,
  }) async {
    try {
      List<InternetAddress> checkConnectivity =
          await InternetAddress.lookup(_hostCheckConnection);
      if (checkConnectivity.isNotEmpty) {
        final String fullPathUri = baseUrl +
            endPoint +
            (queryParameter != null ? '?$queryParameter' : '');
        if (kDebugMode) {
          _printFullUri(fullPathUri, methodRestApi, bodyData);
        }
        try {
          switch (methodRestApi) {
            case MethodRestApi.get:
              final request = http.MultipartRequest(
                'GET',
                Uri.parse(fullPathUri),
              )..headers.addAll(headers!);
              return _handlingResponse(
                await http.Response.fromStream(await request.send())
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.post:
              final request = http.MultipartRequest(
                'POST',
                Uri.parse(fullPathUri),
              )
                ..fields.addAll(bodyData!)
                ..headers.addAll(headers!);
              return _handlingResponse(
                await http.Response.fromStream(await request.send())
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.patch:
              final request = http.MultipartRequest(
                'PATCH',
                Uri.parse(fullPathUri),
              )
                ..fields.addAll(bodyData!)
                ..headers.addAll(headers!);
              return _handlingResponse(
                await http.Response.fromStream(await request.send())
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.put:
              final request = http.MultipartRequest(
                'PUT',
                Uri.parse(fullPathUri),
              )
                ..fields.addAll(bodyData!)
                ..headers.addAll(headers!);
              return _handlingResponse(
                await http.Response.fromStream(await request.send())
                    .timeout(_timeoutDuration),
              );
            case MethodRestApi.delete:
              final request = http.MultipartRequest(
                'DELETE',
                Uri.parse(fullPathUri),
              )
                ..fields.addAll(bodyData!)
                ..headers.addAll(headers!);
              return _handlingResponse(
                await http.Response.fromStream(await request.send())
                    .timeout(_timeoutDuration),
              );
            default:
              return BaseResponseApi(
                success: false,
                message: 'Request Time Out',
                statusCode: 408,
              );
          }
        } on TimeoutException catch (exception, _) {
          return BaseResponseApi(
            success: false,
            message: 'Request Time Out',
            statusCode: 408,
          );
        } catch (_) {
          return BaseResponseApi(
            success: false,
            message: 'Sorry There is something wrong',
            statusCode: 404,
          );
        }
      } else {
        return BaseResponseApi(
          success: false,
          message: 'There is Problem on Internet Connection',
          statusCode: 777,
        );
      }
    } on SocketException catch (_) {
      return BaseResponseApi(
        success: false,
        message: 'There is Problem on Internet Connection',
        statusCode: 777,
      );
    } catch (_) {
      return BaseResponseApi(
        success: false,
        message: 'Sorry There is something wrong',
        statusCode: 404,
      );
    }
  }

  BaseResponseApi _handlingResponse(Response response) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseResponseApi(
          success: true,
          message: 'success',
          statusCode: response.statusCode,
          data: response.body,
        );
      } else {
        return _handleFailureResponse(response.statusCode,
            errorBody: response.body);
      }
    } catch (e) {
      debugPrint('===============================');
      debugPrint('Error Catch : ${e.toString()}');
      debugPrint('===============================');
      return BaseResponseApi(
          success: false, message: 'There is something wrong', statusCode: 404);
    }
  }

  void _printFullUri(
    String fullPathUri,
    MethodRestApi methodCallApi,
    Map<String, dynamic>? bodyData,
  ) {
    debugPrint('===============================');
    debugPrint('method call api : ${methodCallApi.name}');
    debugPrint('full path url : $fullPathUri');
    debugPrint('body : ${bodyData.toString()}');
    debugPrint('===============================');
  }

  BaseResponseApi _handleFailureResponse(int statusCode, {String? errorBody}) {
    switch (statusCode) {
      case 500:
        return BaseResponseApi(
            success: true, message: 'Unknown', statusCode: 500);
      case 401:
        return BaseResponseApi(
            success: true, message: "Unauthorized", statusCode: 401);
      case 403:
        return BaseResponseApi(
            success: false, message: 'Forbidden', statusCode: 403);
      case 404:
        return BaseResponseApi(
            success: false, message: 'Not Found', statusCode: 404);
      case 409:
        return BaseResponseApi(
            success: false, message: 'Conflict', statusCode: 409);
      case 504:
        return BaseResponseApi(
            success: false, message: 'Gateway Timeout', statusCode: 504);
      case 503:
        return BaseResponseApi(
            success: false, message: 'Service Unavailable', statusCode: 503);
      case 502:
        return BaseResponseApi(
            success: false, message: 'Bad Gateway', statusCode: 502);
      case 499:
        return BaseResponseApi(
            success: false, message: 'Client Closed Request', statusCode: 499);
      case 429:
        return BaseResponseApi(
            success: false, message: 'Too Many Request', statusCode: 429);
      case 413:
        return BaseResponseApi(
            success: false, message: 'Payload Too Large', statusCode: 413);
      case 412:
        return BaseResponseApi(
            success: false, message: 'Precondition Failed', statusCode: 412);
      case 411:
        return BaseResponseApi(
            success: false, message: 'Length Required', statusCode: 411);
      case 410:
        return BaseResponseApi(
            success: false, message: 'Gone', statusCode: 410);
      case 405:
        return BaseResponseApi(
            success: false, message: 'Conflict', statusCode: 405);
      case 400:
        return BaseResponseApi(
            success: true,
            message: errorBody ?? 'Bad Request',
            statusCode: 400);
      default:
        return BaseResponseApi(
            success: false,
            message: 'There is something Wrong',
            statusCode: 404);
    }
  }
}
