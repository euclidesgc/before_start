import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_event.dart';
import 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final LoginUsecase usecase;

//   LoginBloc(this.usecase) : super(LoginState());

// //Forma antiga
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginUserNameChanged) {
//       yield state.copyWith(userName: event.userName);
//     }

//     if (event is LoginPasswordChanged) {
//       yield state.copyWith(password: event.password);
//     }

//     if (event is LoginSubmitted) {
//       yield state.copyWith(formStatus: const FormSubmitting());

//       try {
//         CredentialsEntity userCredentials = CredentialsEntity(username: state.userName, password: state.password);
//         await usecase(credentials: userCredentials);
//         yield state.copyWith(formStatus: const SubmissionSuccess());
//       } on Exception catch (e) {
//         yield state.copyWith(formStatus: SubmissionFailed(e));
//       }
//     }
//   }
// }

//Forma nova
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase usecase;

  LoginBloc(this.usecase) : super(LoginState()) {
    on<LoginUserNameChanged>(loginUserNameChanged);
    on<LoginPasswordChanged>(loginPasswordChanged);
    on<LoginSubmitted>(loginSubmitted);
  }

  void loginUserNameChanged(event, emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void loginPasswordChanged(event, emit) {
    emit(state.copyWith(password: event.password));
  }

  void loginSubmitted(event, emit) async {
    EasyLoading.show(status: 'Aguarde ...', maskType: EasyLoadingMaskType.black);

    try {
      CredentialsEntity userCredentials = CredentialsEntity(username: state.userName, password: state.password);
      await usecase(credentials: userCredentials);
      Modular.to.pushReplacementNamed('/dashboard/');
    } on Exception catch (e) {
      EasyLoading.showError("Erro inesperado!", dismissOnTap: true, duration: const Duration(seconds: 5), maskType: EasyLoadingMaskType.black);
      debugPrint(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}




/*


  final LoginUsecase _loginUsecase = Modular.get();
  final _streamController = StreamController<CredentialsEntity>();

  LoginBloc(LoginState initialState) : super(initialState);

  Sink<CredentialsEntity> get loginCredentials => _streamController.sink;
  Stream<UserEntity> get loginResult => _streamController.stream.asyncMap(_efetuarLogin);

  Future<UserEntity> _efetuarLogin(CredentialsEntity credentials) async {
    try {
      final response = await _loginUsecase(credentials: credentials);
      return response;
    } catch (e) {
      throw Exception("Erro ao efetuar login");
    }
  }

  void dispose() {
    _streamController.close();
  }

  @override
  LoginState get initialState => LoginIdle();
*/