import 'package:before_start/modules/home_module/presentation/login/bloc/form_submission_status.dart';

class LoginState {
  final String userName;
  final String password;
  final FormSubmissionStatus formStatus;

  LoginState({
    this.userName = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? userName,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  bool get isValidUserName => userName.length > 3;
  bool get isValidPassword => password.length > 6;
}
