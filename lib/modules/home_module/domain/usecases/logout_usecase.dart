import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';
import 'package:flutter/foundation.dart';

import '../repositories/i_home_repository.dart';

class LogoutUsecase {
  final IHomeRepository repository;

  LogoutUsecase({required this.repository});

  Future call({required UserEntity user}) async {
    try {
      // Obter o usuário atual
      // Precisa do Session Token
      return await repository.logout(user: user);
    } catch (e) {
      debugPrint("$e");
      throw Exception();
    }
  }
}
