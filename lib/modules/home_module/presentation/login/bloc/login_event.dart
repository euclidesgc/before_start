abstract class LoginEvent {}

class LoginUserNameChanged extends LoginEvent {
  final String userName;

  LoginUserNameChanged({required this.userName});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent {}
