import 'package:flutter/foundation.dart';

import '../../../common_module/commom_store.dart';
import '../entities/user_entity.dart';
import '../repositories/i_home_repository.dart';

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
