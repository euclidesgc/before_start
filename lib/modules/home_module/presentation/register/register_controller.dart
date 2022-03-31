import '../../domain/entities/new_user_data_entity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/usecases/register_usecase.dart';

class RegisterController {
  final RegisterUsecase _registerUsecase;

  RegisterController(this._registerUsecase);

  void register({required NewUserDataEntity newUserDataEntity}) async {
    try {
      EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);

      await _registerUsecase(newUserDataEntity: newUserDataEntity);

      EasyLoading.showSuccess(
        'Você precisa verificar seu email para efetuar login',
        duration: const Duration(seconds: 3),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );

      Modular.to.pushReplacementNamed('/login_page');
    } catch (e) {
      EasyLoading.showError(
        'Deu erro!',
        duration: const Duration(seconds: 3),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
