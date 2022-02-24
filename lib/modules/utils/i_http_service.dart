abstract class IHttpService {
  Future<dynamic> request(
      {required Method method,
      required String path,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? customHeaders});
}

// ignore: constant_identifier_names
enum Method { GET, POST, PUT, DELETE }
