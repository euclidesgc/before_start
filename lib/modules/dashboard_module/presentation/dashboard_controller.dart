import 'package:before_start/modules/common_module/commom_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_module/domain/usecases/logout_usecase.dart';

class DashboardController {
  final CommomStore commomStore;
  final LogoutUsecase logoutUsecase;

  DashboardController(
    this.commomStore,
    this.logoutUsecase,
  );

  Future<void> logout() async {
    logoutUsecase(user: commomStore.user);
    Modular.to.popUntil(ModalRoute.withName('/home'));
  }
}
