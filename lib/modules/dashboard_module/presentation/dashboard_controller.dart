import '../../common_module/commom_store.dart';
import '../../home_module/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_module/domain/usecases/logout_usecase.dart';

class DashboardController {
  final CommomStore commomStore;
  final LogoutUsecase logoutUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;

  DashboardController(
    this.commomStore,
    this.logoutUsecase,
    this.getCurrentUserUsecase,
  );

  Future<void> logout() async {
    try {
      EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);
      await logoutUsecase(user: commomStore.user);
      Modular.to.popUntil(ModalRoute.withName('/home'));
    } catch (e) {
      debugPrint("🟠 $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getCurrentUser() async {
    try {
      EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);
      await getCurrentUserUsecase();
    } catch (e) {
      debugPrint("🟠 $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
