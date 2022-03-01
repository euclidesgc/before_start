import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import '../errors/exceptions.dart';
import 'i_http_service.dart';

class DioHttpService implements IHttpService {
  final String applicationId = dotenv.env['applicationId']!;
  final String restApiKey = dotenv.env['restApiKey']!;
  final String baseUrl = dotenv.env['baseUrl']!;

  final _dio = Dio();

  var logger = Logger(
    printer: PrettyPrinter(
        methodCount: 1, // number of method calls to be displayed
        errorMethodCount: 1, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: false, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
    output: null,
  );

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
          logger.i("REQUEST........: [${requestOptions.method}] '${requestOptions.path}'\n"
              "REQUEST VALUES.: ${requestOptions.queryParameters}\n"
              "HEADERS........: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger.i("RESPONSE..: StatusCode: [${response.statusCode}]\n"
              "DATA.....: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.e("Error..: StatusCode: [${err.response?.statusCode}]");
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
    Options? options = Options();

    if (customHeaders != null) {
      options.headers = _dio.options.headers;
      options.headers!.addAll(customHeaders);
    }

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
        debugPrint("🟠 Response.code out of range 2xx : ${e.response!.statusCode}");
        if (e.response!.statusCode == 400) {
          debugPrint(e.response!.data["error"]);
          throw BadRequestException(message: e.response!.data["error"]);
        }
        if (e.response!.statusCode == 401) {
          throw UnimplementedError();
        }
        if (e.response!.data["code"] == 101) {
          debugPrint("🟠 Login ou senha inválida");
          throw UnimplementedError();
        }
        return e.response;
      }
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
