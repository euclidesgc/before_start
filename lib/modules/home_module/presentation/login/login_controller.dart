import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/credentials_entity.dart';
import '../../domain/entities/user_entity.dart';

class LoginController {
  final LoginUsecase loginUsecase = Modular.get();

  LoginController();

  void efetuarLogin({required String username, required String password}) async {
    CredentialsEntity userCredentials = CredentialsEntity(username: username.trim(), password: password.trim());

    try {
      EasyLoading.show(status: 'Carregando...', maskType: EasyLoadingMaskType.black);
      final UserEntity user = await loginUsecase(credentials: userCredentials);

      Modular.to.pushReplacementNamed('/dashboard/');
    } catch (e) {
      throw Exception();
    } finally {
      EasyLoading.dismiss();
    }
  }
}
