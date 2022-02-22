import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';
import 'package:before_start/modules/home_module/domain/repositories/i_login_repository.dart';
import 'package:flutter/foundation.dart';

class LoginUsecase {
  final ILoginRepository repository;

  LoginUsecase({required this.repository});

  Future<UserEntity> call({required CredentialsEntity credentials}) async {
    try {
      return await repository.login(credentials: credentials);
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }
}
