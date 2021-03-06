import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../common_module/errors/exceptions.dart';
import '../../domain/usecases/verification_email_request_usecase.dart';

class VerificationEmailRequestController {
  final VerificationEmailRequestUsecase _verificationEmailRequestUsecase;

  VerificationEmailRequestController(this._verificationEmailRequestUsecase);

  void verificationEmailRequest({required String email}) async {
    try {
      EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);
      await _verificationEmailRequestUsecase(email: email.trim());
      EasyLoading.showSuccess(
        "Verifique seu Email para ativar sua conta",
        dismissOnTap: true,
        duration: const Duration(seconds: 3),
        maskType: EasyLoadingMaskType.black,
      );
      Modular.to.pushReplacementNamed('/login_page');
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
