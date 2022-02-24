import '../models/credentials_model.dart';
import '../models/user_model.dart';

abstract class IHomeDatasource {
  Future<UserModel> login({required CredentialsModel credentials});
  Future logout({required UserModel userModel});

}
