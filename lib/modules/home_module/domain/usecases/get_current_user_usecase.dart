/*

# Don't forget to set the session token, received
# when you logged in or signed up
curl -X GET \
-H "X-Parse-Application-Id: 9k6Er3wTULxfBvjG12SXh4QbZ93cSMxrpXClMlpc" \
-H "X-Parse-REST-API-Key: lCIuL0H29AyrDCloq6XLbu9fIpYPNyQMuao9vYNO" \
-H "X-Parse-Session-Token: <SESSION_TOKEN>" \
https://mentoriabeforestart.b4a.io/users/me

*/

import 'package:before_start/modules/home_module/domain/repositories/i_home_repository.dart';

class GetCurrentUserUsecase {
  final IHomeRepository repository;

  GetCurrentUserUsecase(this.repository);

  // Future<UserEntity> call() async{
  // try{
  //   return await repository.getCurrentUser
  // }
  // }
}
