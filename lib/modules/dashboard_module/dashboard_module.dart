import '../home_module/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../common_module/commom_module.dart';
import '../common_module/commom_store.dart';
import '../home_module/domain/usecases/get_current_user_usecase.dart';
import '../home_module/domain/usecases/logout_usecase.dart';
import 'presentation/dashboard_controller.dart';
import 'presentation/dashboard_page.dart';

class DashboardModule extends Module {
  
  @override
  List<Module> get imports => [
        CommomModule(),
        HomeModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DashboardController(i<CommomStore>(), i<LogoutUsecase>(), i<GetCurrentUserUsecase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DashboardPage()),
      ];
}
