import 'package:before_start/modules/home_module/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../design_system/design_sistem.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(AppImages.logo),
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      labelText: 'Login',
                      controller: controllerUsername,
                      enabled: !isLoggedIn,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe seu login';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      labelText: 'Password',
                      controller: controllerPassword,
                      enabled: !isLoggedIn,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe sua senha';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: AppButton(
                        label: 'Entrar',
                        onPressed: isLoggedIn
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  controller.efetuarLogin(login: controllerUsername.text, senha: controllerPassword.text);
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              AppButton.secondary(
                label: 'Esqueceu a senha?',
                onPressed: () => Modular.to.pushNamed('/reset_password_page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
