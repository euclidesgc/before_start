import 'package:flutter_modular/flutter_modular.dart';

import '../common_module/commom_module.dart';
import '../common_module/commom_store.dart';
import '../common_module/http_service/i_http_service.dart';
import 'data/datasources/home_datasource.dart';
import 'data/datasources/i_home_datasource.dart';
import 'data/repositories/home_repository.dart';
import 'domain/repositories/i_home_repository.dart';
import 'domain/usecases/get_current_user_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/logout_usecase.dart';
import 'domain/usecases/register_usecase.dart';
import 'domain/usecases/request_password_reset_usecase.dart';
import 'domain/usecases/verification_email_request_usecase.dart';
import 'home_page.dart';
import 'presentation/login/login_controller.dart';
import 'presentation/login/login_page.dart';
import 'presentation/register/register_controller.dart';
import 'presentation/register/register_page.dart';
import 'presentation/reset_password/request_password_reset_controller.dart';
import 'presentation/reset_password/request_password_reset_page.dart';
import 'presentation/verification_email_request/verification_email_request_controller.dart';
import 'presentation/verification_email_request/verification_email_request_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CommomModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeDatasource(httpClient: i<IHttpService>()), export: true),
        Bind.singleton((i) => HomeRepository(datasource: i<IHomeDatasource>()), export: true),
        Bind.singleton((i) => LoginUsecase(repository: i<IHomeRepository>(), store: i<CommomStore>()), export: true),
        Bind.singleton((i) => LogoutUsecase(repository: i<IHomeRepository>()), export: true),
        Bind.singleton((i) => GetCurrentUserUsecase(store: i<CommomStore>(), repository: i<IHomeRepository>()), export: true),
        Bind.singleton((i) => LoginController(i<LoginUsecase>()), export: true),
        Bind.singleton((i) => RequestPasswordResetUsecase(repository: i<IHomeRepository>()), export: true),
        Bind.singleton((i) => RequestPasswordResetController(i<RequestPasswordResetUsecase>()), export: true),
        Bind.singleton((i) => RegisterUsecase(store: i<CommomStore>(), repository: i<IHomeRepository>()), export: true),
        Bind.singleton((i) => VerificationEmailRequestUsecase(repository: i<IHomeRepository>()), export: true),
        Bind.singleton((i) => RegisterController(i<RegisterUsecase>()), export: true),
        Bind.singleton((i) => VerificationEmailRequestController(i<VerificationEmailRequestUsecase>()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/login_page', child: (context, args) => const LoginPage()),
        ChildRoute('/register_page', child: (context, args) => const RegisterPage()),
        ChildRoute('/verification_email_request_page', child: (context, args) => const VerificationEmailRequestPage()),
        ChildRoute('/reset_password_page', child: (context, args) => const RequestPasswordResetPage()),
      ];
}
