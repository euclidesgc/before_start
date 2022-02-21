import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';

import '../domain/entities/credentials_entity.dart';
import '../domain/entities/user_entity.dart';

class LoginController {
  final LoginUsecase usecase;

  LoginController({required this.usecase});

  void efetuarLogin({required String username, required String password}) async {
    CredentialsEntity userCredentials = CredentialsEntity(username: username.trim(), password: password.trim());

    final UserEntity user = await usecase(credentials: userCredentials);
    debugPrint(user.toString());

    // final username = login.trim();
    // final password = senha.trim();

    // final user = ParseUser(username, password, null);
    // var response = await user.login();

    // if (response.success) {
    //   Modular.to.pushReplacementNamed('/dashboard/');
    // } else {
    //   //implementar isso usando Bloc
    //   // throw LoginError(message: response.error!.message);
    // }
  }
}
