abstract class IHttpService {
  Future<dynamic> get(String path, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders);
  Future<dynamic> post(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders});
  Future<dynamic> put(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders});
  Future<dynamic> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, String>? customHeaders});
}
