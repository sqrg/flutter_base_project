import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter_base_project/core/api/api_exceptions.dart';

class ApiClient {
  final String baseUrl = '';

  Dio _dio = Dio();

  Future<dynamic> get(String endpoint, {Map<String, String>? headers, Map<String, dynamic>? queryParameters}) async {
    var responseJson;

    try {
      final response = await _dio.get(baseUrl + endpoint, queryParameters: queryParameters, options: Options(headers: headers));

      responseJson = handleResponse(response);
    } catch (e) {
      throw e;
    }

    return responseJson;
  }

  Future<dynamic> post(String endpoint, {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    var responseJson;

    try {
      final response = await _dio.post(baseUrl + endpoint, options: Options(headers: headers), data: body);

      responseJson = handleResponse(response);
    } catch (e) {
      throw e;
    }

    return responseJson;
  }

  dynamic handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 302:
        throw UnimplementedError();
      case 400:
        throw BadRequestException(response.data);
      case 401:
        throw UnauthorizedException(response.data);
      case 405:
        throw NotAllowedException(response.data);
      case 422:
        throw ValidationException.fromJson(json.decode(response.data));
      default:
    }
  }
}
