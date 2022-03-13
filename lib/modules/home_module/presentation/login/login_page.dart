import 'package:before_start/modules/home_module/domain/usecases/login_usecase.dart';
import 'package:before_start/modules/home_module/presentation/login/bloc/login_bloc.dart';
import 'package:before_start/modules/home_module/presentation/login/bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' hide ModularWatchExtension;

import '../../../design_system/design_sistem.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  final LoginUsecase loginUsecase;

  LoginPage({Key? key, required this.loginUsecase}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(loginUsecase),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 200,
                child: Image.asset(AppImages.logo),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _loginForm(),
            ),
          ],
        ),
        bottomSheet: _loginButton(),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _loginField(),
          const SizedBox(height: 16),
          _passwordField(),
          _forgotPasswordButton(),
          // const SizedBox(height: 16),
          // _loginButton(),
        ],
      ),
    );
  }

  Widget _forgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text("Esqueceu a senha?"),
        onPressed: () => Modular.to.pushNamed('/reset_password_page'),
      ),
    );
  }

  Widget _loginField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return AppTextField(
          labelText: 'Login',
          hintText: "Informe seu nome de usuário",
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.none,
          validator: (value) => state.isValidUserName ? null : "Login inválido",
          onChanged: (value) => context.read<LoginBloc>().add(LoginUserNameChanged(userName: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return AppTextField(
          labelText: 'Password',
          hintText: "Informe sua senha",
          obscureText: true,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.none,
          validator: (value) => state.isValidPassword ? null : "password inválido",
          onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 40),
          child: AppButton(
            label: 'Entrar',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(LoginSubmitted());
              }
            },
          ),
        );
      },
    );
  }
}
