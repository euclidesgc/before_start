import '../entities/credentials_entity.dart';
import '../entities/new_user_data_entity.dart';
import '../entities/user_entity.dart';

import '../entities/registered_user_entity.dart';

abstract class IHomeRepository {
  Future<UserEntity> login({required CredentialsEntity credentials});
  Future<RegisteredUserEntity> register({required NewUserDataEntity newUserDataEntity});
  Future logout({required UserEntity user});
  Future<UserEntity> getCurrentUser({required String sessionToken});
  Future<void> requestPasswordReset({required String email});
  Future<void> verificationEmailRequest({required String email});
}
