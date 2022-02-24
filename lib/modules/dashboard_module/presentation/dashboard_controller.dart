import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../home_module/domain/usecases/logout_usecase.dart';

class DashboardController {
  Future<void> logoutUsecase({required UserEntity user}) async {
    LogoutUsecase logoutUsecase = Modular.get();
    logoutUsecase(user: user);
  }
}
