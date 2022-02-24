import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/dashboard_controller.dart';
import 'presentation/dashboard_page.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DashboardController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DashboardPage()),
      ];
}
