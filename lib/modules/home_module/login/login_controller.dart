import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/entities/credentials_entity.dart';
import '../domain/entities/user_entity.dart';

class LoginController {
  final LoginUsecase usecase;

  LoginController({required this.usecase});

  void efetuarLogin({required String username, required String password}) async {
    CredentialsEntity userCredentials = CredentialsEntity(username: username.trim(), password: password.trim());

    try {
      final UserEntity user = await usecase(credentials: userCredentials);
      Modular.to.pushReplacementNamed('/dashboard/');
    } catch (e) {
      throw Exception();
    }
    // debugPrint(user.toString());

    // final username = login.trim();
    // final password = senha.trim();

    // final user = ParseUser(username, password, null);
    // var response = await user.login();

    // if (response.success) {
    //   Modular.to.pushReplacementNamed('/dashboard/');
    // } else {
    //   //implementar isso usando Bloc
    // throw LoginError(message: response.error!.message);
    // }
  }
}
