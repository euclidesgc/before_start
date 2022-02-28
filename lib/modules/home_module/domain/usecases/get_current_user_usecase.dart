import 'package:before_start/modules/common_module/commom_store.dart';
import 'package:before_start/modules/home_module/domain/repositories/i_home_repository.dart';
import 'package:flutter/foundation.dart';

import '../entities/user_entity.dart';

class GetCurrentUserUsecase {
  final IHomeRepository repository;
  final CommomStore store;

  GetCurrentUserUsecase({required this.repository, required this.store});

  Future<UserEntity> call() async {
    try {
      return await repository.getCurrentUser(sessionToken: store.user.sessionToken);
    } catch (e) {
      debugPrint("🔴 $e");
      throw Exception();
    }
  }
}
