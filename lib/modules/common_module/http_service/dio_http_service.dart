import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'i_http_service.dart';

class DioHttpService implements IHttpService {
  final String applicationId = dotenv.env['applicationId']!;
  final String restApiKey = dotenv.env['restApiKey']!;
  final String baseUrl = dotenv.env['baseUrl']!;

  final _dio = Dio();

  DioHttpService({List<Interceptor> interceptors = const []}) {
    _dio.options = BaseOptions(
      baseUrl: baseUrl, connectTimeout: 5000, receiveTimeout: 100000,
      // Default headers
      headers: {
        'x-parse-application-id': applicationId,
        'x-parse-rest-api-key': restApiKey,
      },
    );
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
  Future<dynamic> request(
      {required Method method,
      required String path,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? customHeaders}) async {
    Options? options;
    if (customHeaders != null) options = Options(headers: customHeaders);

    try {
      switch (method) {
        case Method.GET:
          final response = await _dio.get(path, queryParameters: queryParameters, options: options);
          return response;
        case Method.POST:
          final response = await _dio.post(path, data: data, queryParameters: queryParameters, options: options);
          return response;
        case Method.PUT:
          final response = await _dio.put(path, data: data, queryParameters: queryParameters, options: options);
          return response;
        case Method.DELETE:
          final response = await _dio.delete(path, data: data, queryParameters: queryParameters, options: options);
          return response;
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.type == DioErrorType.connectTimeout) {
        debugPrint("Timeout!");
      }
      if (e.type == DioErrorType.response) {
        debugPrint("🔴 Response.code out of range 2xx : ${e.response!.statusCode}");
        if (e.response!.statusCode == 401) {
          // retornar o tratamento padrão para não autorizado
          // implementar tabém para outros tipos de erros
          throw UnimplementedError();
        }
        if (e.response!.data["code"] == 101) {
          // retornar o tratamento padrão para não autorizado
          // implementar tabém para outros tipos de erros
          debugPrint("🔴 Login ou senha inválida");
          throw UnimplementedError();
        }
        return e.response;
      }
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
