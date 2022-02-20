import 'package:before_start/modules/utils/errors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginController with ReassembleMixin {
  void efetuarLogin({required String login, required String senha}) async {
    final username = login.trim();
    final password = senha.trim();

    final user = ParseUser(username, password, null);
    var response = await user.login();

    if (response.success) {
      Modular.to.pushReplacementNamed('/dashboard/');
    } else {
      //implementar isso usando Bloc
      throw LoginError(message: response.error!.message);
    }
  }

  @override
  void reassemble() {
    debugPrint('reassemble');
  }
}
