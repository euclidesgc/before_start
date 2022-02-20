import 'package:flutter_modular/flutter_modular.dart';

import 'dashboard_page.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const DashboardPage()),
      ];
}
