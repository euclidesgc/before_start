import 'package:before_start/modules/home_module/domain/entities/credentials_entity.dart';
import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';

abstract class IHomeRepository {
  Future<UserEntity> login({required CredentialsEntity credentials});
  Future logout({required UserEntity user});
}
