import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';
import 'package:before_start/modules/home_module/domain/repositories/i_home_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../common_module/commom_store.dart';

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
      debugPrint("🔴 $e");
      rethrow;
    }
  }
}
