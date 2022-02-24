// class LoginUsecase {
//   final IHomeRepository repository;

//   LoginUsecase({required this.repository});

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
