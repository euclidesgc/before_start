import 'package:before_start/modules/home_module/data/models/credentials_model.dart';
import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:before_start/modules/home_module/domain/repositories/i_login_repository.dart';
import 'package:before_start/modules/utils/failures.dart';

import '../../domain/entities/user_entity.dart';
import '../datasources/i_login_datasource.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource datasource;

  LoginRepository({required this.datasource});

  @override
  Future<UserEntity> login({required CredentialsEntity credentials}) async {
    final CredentialsModel credentialsModel = CredentialsModel(login: credentials.username.trim(), password: credentials.password.trim());

    try {
      final userModel = await datasource.login(credentials: credentialsModel);

      UserEntity userEntity = UserEntity(
        objectId: userModel.objectId,
        username: userModel.username,
        createdAt: userModel.createdAt,
        updatedAt: userModel.updatedAt,
        emailVerified: userModel.emailVerified,
        sessionToken: userModel.sessionToken,
      );
      return userEntity;
    } catch (e) {
      throw ServerFailure();
    }
  }
}



// void efetuarLogin({required String login, required String senha}) async {
//     final username = login.trim();
//     final password = senha.trim();

//     final user = ParseUser(username, password, null);
//     var response = await user.login();

//     if (response.success) {
//       Modular.to.pushReplacementNamed('/dashboard/');
//     } else {
//       //implementar isso usando Bloc
//       throw LoginError(message: response.error!.message);
//     }
//   }