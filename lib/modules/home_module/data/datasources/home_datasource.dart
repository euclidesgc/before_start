import 'package:flutter/foundation.dart';

import '../../../utils/i_http_service.dart';
import '../models/credentials_model.dart';
import '../models/user_model.dart';
import 'i_home_datasource.dart';

class HomeDatasource implements IHomeDatasource {
  final IHttpService httpClient;

  HomeDatasource({required this.httpClient});

  @override
  Future<UserModel> login({required CredentialsModel credentials}) async {
    Map<String, dynamic> loginCredentials = {"username": credentials.login, "password": credentials.password};

    try {
      final response = await httpClient.request(method: Method.POST, path: '/login', data: loginCredentials);

      return UserModel.fromJson(response.data);
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }

  @override
  Future logout({required UserModel userModel}) async {
    try {
      await httpClient.request(method: Method.POST, path: '/Logout', customHeaders: {"X-Parse-Session-Token": userModel.sessionToken});
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }
}
