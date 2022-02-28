import 'package:before_start/modules/home_module/domain/repositories/i_home_repository.dart';
import 'package:flutter/foundation.dart';

import '../../../common_module/commom_store.dart';
import '../entities/new_user_data_entity.dart';
import '../entities/registered_user_entity.dart';

class RegisterUsecase {
  final IHomeRepository repository;
  final CommomStore store;

  RegisterUsecase({required this.store, required this.repository});

  Future<RegisteredUserEntity> call({required NewUserDataEntity newUserDataEntity}) async {
    try {
      final response = await repository.register(newUserDataEntity: newUserDataEntity);
      return response;
    } catch (e) {
      debugPrint("🔴 $e");
      throw Exception();
    }
  }
}
