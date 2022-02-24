import 'package:before_start/modules/home_module/data/datasources/home_datasource.dart';
import 'package:before_start/modules/home_module/data/repositories/home_repository.dart';
import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:before_start/modules/home_module/home_page.dart';
import 'package:before_start/modules/home_module/presentation/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../common_module/commom_module.dart';

import '../common_module/http_service/i_http_service.dart';
import 'data/datasources/i_home_datasource.dart';
import 'domain/repositories/i_home_repository.dart';
import 'domain/usecases/logout_usecase.dart';
import 'presentation/login/login_page.dart';
import 'presentation/register/register_page.dart';
import 'presentation/reset_password/reset_password_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CommomModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeDatasource(httpClient: i<IHttpService>()), export: true),
        Bind.singleton((i) => HomeRepository(datasource: i<IHomeDatasource>()), export: true),
        Bind.singleton((i) => LoginUsecase(repository: i<IHomeRepository>()), export: true),
        Bind.singleton((i) => LogoutUsecase(repository: i<IHomeRepository>()), export: true),
        Bind.singleton((i) => LoginController()),
        
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/login_page', child: (context, args) => const LoginPage()),
        ChildRoute('/register_page', child: (context, args) => const RegisterPage()),
        ChildRoute('/reset_password_page', child: (context, args) => const ResetPasswordPage()),
      ];
}
