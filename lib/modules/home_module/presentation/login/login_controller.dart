import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../common_module/errors/exceptions.dart';
import '../../domain/entities/credentials_entity.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginController {
  final LoginUsecase _loginUsecase;

  LoginController(this._loginUsecase);

  void efetuarLogin({required String username, required String password}) async {
    CredentialsEntity userCredentials = CredentialsEntity(username: username.trim(), password: password.trim());

    try {
      EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);
      await _loginUsecase(credentials: userCredentials);

      Modular.to.pushReplacementNamed('/dashboard/');
    } on Exception catch (e) {
      if (e is BadRequestException) {
        EasyLoading.showError(e.message!, dismissOnTap: true, duration: const Duration(seconds: 5), maskType: EasyLoadingMaskType.black);
        Modular.to.pushNamed('/verification_email_request_page');
      }
    } catch (e) {
      EasyLoading.showError("Erro inesperado!", dismissOnTap: true, duration: const Duration(seconds: 5), maskType: EasyLoadingMaskType.black);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
