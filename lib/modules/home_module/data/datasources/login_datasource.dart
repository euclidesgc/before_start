import 'package:flutter/foundation.dart';

import '../../../utils/dio_http_service.dart';
import '../models/credentials_model.dart';
import '../models/user_model.dart';
import 'i_login_datasource.dart';

class LoginDatasource implements ILoginDatasource {
  final DioHttpService httpClient;

  LoginDatasource({required this.httpClient});

  @override
  Future<UserModel> login({required CredentialsModel credentials}) async {
    Map<String, dynamic> loginCredentials = {"username": credentials.login, "password": credentials.password};

    try {
      final response = await httpClient.post('https://parseapi.back4app.com/login', data: loginCredentials);

      return UserModel.fromJson(response.data);
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }
}
