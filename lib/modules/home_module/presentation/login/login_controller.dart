import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/exceptions.dart';
import '../../domain/entities/credentials_entity.dart';

class LoginController {
  final LoginUsecase loginUsecase;

  LoginController(this.loginUsecase);

  void efetuarLogin({required String username, required String password}) async {
    CredentialsEntity userCredentials = CredentialsEntity(username: username.trim(), password: password.trim());

    try {
      EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);
      await loginUsecase(credentials: userCredentials);

      Modular.to.pushReplacementNamed('/dashboard/');
    } on Exception catch (e) {
      if (e is BadRequestException) {
        EasyLoading.showError(e.message!, dismissOnTap: true, duration: const Duration(seconds: 5), maskType: EasyLoadingMaskType.black);
      }
    } catch (e) {
        EasyLoading.showError("Erro inesperado!", dismissOnTap: true, duration: const Duration(seconds: 5), maskType: EasyLoadingMaskType.black);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
