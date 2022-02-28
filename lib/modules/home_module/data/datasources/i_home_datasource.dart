import 'package:before_start/modules/home_module/data/models/new_user_data_model.dart';

import '../models/credentials_model.dart';
import '../models/registered_user_model.dart';
import '../models/user_model.dart';

abstract class IHomeDatasource {
  Future<UserModel> login({required CredentialsModel credentials});
  Future<RegisteredUserModel> register({required NewUserDataModel newUserDataModel});
  Future logout({required UserModel userModel});
  Future<UserModel> getCurrentUser({required String sessionToken});
  Future<void> requestPasswordReset({required String email});
  Future<void> verificationEmailRequest({required String email});
}
