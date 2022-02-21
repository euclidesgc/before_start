import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';

abstract class ILoginRepository {
  Future<UserEntity> login({required CredentialsEntity credentials});
}
