import 'package:flutter/foundation.dart';

import '../../../common_module/commom_store.dart';
import '../entities/credentials_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/i_home_repository.dart';

class LoginUsecase {
  final IHomeRepository repository;
  final CommomStore store;

  LoginUsecase({required this.store, required this.repository});

  Future<UserEntity> call({required CredentialsEntity credentials}) async {
    try {
      final response = await repository.login(credentials: credentials);
      store.user = response;
      return response;
    } catch (e) {
      debugPrint("🟠 $e");
      rethrow;
    }
  }
}
