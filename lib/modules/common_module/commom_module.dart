import 'commom_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'http_service/dio_http_service.dart';

class CommomModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => CommomStore(), export: true),
        Bind.singleton(<IHttpService>(i) => DioHttpService(), export: true),
      ];

  @override
  List<ModularRoute> get routes => [];
}
