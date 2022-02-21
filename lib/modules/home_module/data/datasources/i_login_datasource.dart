import '../models/credentials_model.dart';
import '../models/user_model.dart';

abstract class ILoginDatasource {
  Future<UserModel> login({required CredentialsModel credentials});
}
