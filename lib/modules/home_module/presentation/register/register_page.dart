import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../design_system/design_sistem.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo usuário'),
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
          const Center(
            child: Text('Registro de usuário', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _loginForm(),
          ),
        ],
      ),
      bottomSheet: _registerButton(),
    );
  }

  Widget _registerButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 40),
      child: AppButton(
        label: 'Salvar',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // NewUserDataEntity newUserDataEntity = NewUserDataEntity(
            //   email: controllerEmailTEC.text.trim(),
            //   password: controllerPasswordTEC.text.trim(),
            //   username: controllerUsernameTEC.text.trim(),
            // );
            // controller.register(newUserDataEntity: newUserDataEntity);
          }
        },
      ),
    );
  }

  Form _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _loginField(),
          const SizedBox(height: 16),
          _emailField(),
          const SizedBox(height: 16),
          _passwordField(),
          const SizedBox(height: 16),
          // _registerButton()
        ],
      ),
    );
  }

  Widget _passwordField() {
    return AppTextField(
      labelText: 'Password',
      obscureText: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      validator: (value) => null,
      onChanged: (value) => {},
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Informe uma senha';
      //   } else if (value.length < 3) {
      //     return 'A senha precisa ter no mínimo 4 caracteres';
      //   }
      //   return null;
      // },
    );
  }

  Widget _emailField() {
    return AppTextField(
      labelText: 'E-mail',
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: (value) => null,
      onChanged: (value) => {},
      // validator: (value) {
      //   if (value == null || value.isEmpty || !Validation.emailIsValid(value)) {
      //     return 'Informe um e-mail válido';
      //   }
      //   return null;
      // },
    );
  }

  Widget _loginField() {
    return AppTextField(
      labelText: 'Login',
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      validator: (value) => null,
      onChanged: (value) => {},
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Informe um nome de usuário';
      //   } else if (value.length < 3) {
      //     return 'Informe um nome com mais de 3 letras.';
      //   }
      //   return null;
      // },
    );
  }
}
