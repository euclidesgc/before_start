import 'package:before_start/modules/home_module/domain/usecases/request_password_reset_usecase.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RequestPasswordResetController {
  final RequestPasswordResetUsecase _requestPasswordResetUsecase;

  RequestPasswordResetController(this._requestPasswordResetUsecase);

  void requestPasswordReset({required String email}) async {
    try {
      EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);
      await _requestPasswordResetUsecase(email: email.trim());
      EasyLoading.showSuccess(
        "Email de recuperação de senha enviado!",
        dismissOnTap: true,
        duration: const Duration(seconds: 3),
        maskType: EasyLoadingMaskType.black,
      );
      Modular.to.pushReplacementNamed('/login_page');
    } catch (e) {
      throw Exception();
    } finally {
      EasyLoading.dismiss();
    }
  }
}
