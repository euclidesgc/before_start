import 'dart:async';

import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginBloc {
  final LoginUsecase _loginUsecase = Modular.get();

  final _streamController = StreamController<CredentialsEntity>();
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
}
