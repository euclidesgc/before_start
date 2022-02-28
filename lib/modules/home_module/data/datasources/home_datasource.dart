import 'package:before_start/modules/home_module/data/models/registered_user_model.dart';
import 'package:before_start/modules/home_module/data/models/new_user_data_model.dart';
import 'package:flutter/foundation.dart';

import '../../../common_module/http_service/i_http_service.dart';
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
      return UserModel.fromMap(response.data);
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

  @override
  Future<UserModel> getCurrentUser({required String sessionToken}) async {
    try {
      final result = await httpClient.request(method: Method.GET, path: '/users/me', customHeaders: {"X-Parse-Session-Token": sessionToken});
      return UserModel.fromMap(result.data);
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }

  @override
  Future<void> requestPasswordReset({required String email}) async {
    try {
      await httpClient.request(method: Method.POST, path: '/requestPasswordReset', data: {"email": email});
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }

  @override
  Future<void> verificationEmailRequest({required String email}) async {
    try {
      await httpClient.request(method: Method.POST, path: '/verificationEmailRequest', data: {"email": email});
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }

  @override
  Future<RegisteredUserModel> register({required NewUserDataModel newUserDataModel}) async {
    try {
      final result = await httpClient.request(method: Method.POST, path: '/users', data: newUserDataModel.toMap());
      return RegisteredUserModel.fromMap(result.data);
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }
}
