import 'package:before_start/modules/common_module/commom_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/dashboard_module/dashboard_module.dart';
import 'modules/home_module/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => CommomStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/dashboard', module: DashboardModule()),
      ];
}
