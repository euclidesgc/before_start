import 'package:before_start/modules/home_module/data/datasources/login_datasource.dart';
import 'package:before_start/modules/home_module/data/repositories/login_repository.dart';
import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:before_start/modules/home_module/home_page.dart';
import 'package:before_start/modules/home_module/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../utils/dio_http_service.dart';
import 'login/login_page.dart';
import 'register/register_page.dart';
import 'reset_password/reset_password_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DioHttpService()),
        Bind.singleton((i) => LoginDatasource(httpClient: i<DioHttpService>())),
        Bind.singleton((i) => LoginRepository(datasource: i<LoginDatasource>())),
        Bind.singleton((i) => LoginUsecase(repository: i<LoginRepository>())),
        Bind.singleton((i) => LoginController(usecase: i<LoginUsecase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/login_page', child: (context, args) => const LoginPage()),
        ChildRoute('/register_page', child: (context, args) => const RegisterPage()),
        ChildRoute('/reset_password_page', child: (context, args) => const ResetPasswordPage()),
      ];
}
