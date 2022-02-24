import 'package:before_start/modules/home_module/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../common_module/commom_module.dart';
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
        Bind.singleton((i) => DashboardController(i(),i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DashboardPage()),
      ];
}
