import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'i_http_service.dart';

class DioHttpService implements IHttpService {
  final Dio _dio = Dio();

  final String keyApplicationId = dotenv.env['keyApplicationId']!;
  final String keyClientKey = dotenv.env['keyClientKey']!;
  final String baseUrl = dotenv.env['keyParseServerUrl']!;

  DioHttpService({List<Interceptor> interceptors = const []}) {
    //Add Default headers
    _dio.options.headers.addAll({"x-parse-application-id": keyApplicationId, "x-parse-rest-api-key": keyClientKey});
    _dio.options.baseUrl = baseUrl;
    initInterceptors();
  }

  void initInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) {
          return handler.next(err);
        },
      ),
    );
  }

  @override
  Future<dynamic> get(String path, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders) async {
    Options? options;

    if (customHeaders != null) options = Options(headers: customHeaders);

    try {
      final response = await _dio.get(path, queryParameters: queryParameters, options: options);

      if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        return response;
      }
    } on SocketException catch (e) {
      throw Exception("Not Internet Connection\n$e");
    } on FormatException catch (e) {
      throw Exception("Bad response format\n$e");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something wen't wrong\n$e");
    }
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders}) async {
    Options? options;
    if (customHeaders != null) options = Options(headers: customHeaders);

    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParameters, options: options);

      if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        return response;
      }
    } on SocketException catch (e) {
      throw Exception("Not Internet Connection\n$e");
    } on FormatException catch (e) {
      throw Exception("Bad response format\n$e");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something wen't wrong\n$e");
    }
  }

  @override
  Future<dynamic> put(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders}) async {
    Options? options;
    if (customHeaders != null) options = Options(headers: customHeaders);

    try {
      final response = await _dio.put(path, data: data, queryParameters: queryParameters, options: options);

      if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        return response;
      }
    } on SocketException catch (e) {
      throw Exception("Not Internet Connection\n$e");
    } on FormatException catch (e) {
      throw Exception("Bad response format\n$e");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something wen't wrong\n$e");
    }
  }

  @override
  Future<dynamic> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders}) async {
    Options? options;
    if (customHeaders != null) options = Options(headers: customHeaders);

    try {
      final response = await _dio.delete(path, data: data, queryParameters: queryParameters, options: options);

      if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        return response;
      }
    } on SocketException catch (e) {
      throw Exception("Not Internet Connection\n$e");
    } on FormatException catch (e) {
      throw Exception("Bad response format\n$e");
    } on DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something wen't wrong\n$e");
    }
  }
}
