import 'package:before_start/modules/home_module/data/models/credentials_model.dart';
import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:before_start/modules/home_module/domain/entities/new_user_data_entity.dart';
import 'package:before_start/modules/home_module/domain/entities/registered_user_entity.dart';
import 'package:before_start/modules/home_module/domain/repositories/i_home_repository.dart';
import 'package:before_start/modules/utils/exceptions.dart';
import 'package:before_start/modules/utils/failures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../domain/entities/user_entity.dart';
import '../datasources/i_home_datasource.dart';

class HomeRepository implements IHomeRepository {
  final IHomeDatasource datasource;

  HomeRepository({required this.datasource});

  @override
  Future<UserEntity> login({required CredentialsEntity credentials}) async {
    final CredentialsModel credentialsModel = CredentialsModel(login: credentials.username.trim(), password: credentials.password.trim());

    try {
      final userModel = await datasource.login(credentials: credentialsModel);
      return userModel.toUserEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future logout({required UserEntity user}) async {
    try {
      await datasource.logout(userModel: user.toUserModel());
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<UserEntity> getCurrentUser({required String sessionToken}) async {
    try {
      final userModel = await datasource.getCurrentUser(sessionToken: sessionToken);
      return userModel.toUserEntity();
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<void> requestPasswordReset({required String email}) async {
    try {
      await datasource.requestPasswordReset(email: email);
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<void> verificationEmailRequest({required String email}) async {
    try {
      await datasource.verificationEmailRequest(email: email);
    } catch (e) {
      throw ServerFailure();
    }
  }

  @override
  Future<RegisteredUserEntity> register({required NewUserDataEntity newUserDataEntity}) async {
    try {
      final result = await datasource.register(newUserDataModel: newUserDataEntity.toNewUserDataModel());
      return result.toRegisteredUserEntity();
    } catch (e) {
      throw ServerFailure();
    }
  }
}
