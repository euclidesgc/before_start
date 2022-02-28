import 'package:flutter/foundation.dart';

import '../repositories/i_home_repository.dart';

class RequestPasswordResetUsecase {
  final IHomeRepository repository;

  RequestPasswordResetUsecase({required this.repository});

  Future call({required String email}) async {
    try {
      await repository.requestPasswordReset(email: email);
    } catch (e) {
      debugPrint("🔴 $e");
      throw Exception();
    }
  }
}
