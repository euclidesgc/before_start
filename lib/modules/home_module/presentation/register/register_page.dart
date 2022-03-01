import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../common_module/utils/validation.dart';
import '../../../design_system/design_sistem.dart';
import '../../domain/entities/new_user_data_entity.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterController> {
  final controllerUsernameTEC = TextEditingController();
  final controllerPasswordTEC = TextEditingController();
  final controllerEmailTEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Novo usuário'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset(AppImages.logo),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text('Registro de usuário', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 32),
                  AppTextField(
                    labelText: 'Login',
                    controller: controllerUsernameTEC,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe um nome de usuário';
                      } else if (value.length < 3) {
                        return 'Informe um nome com mais de 3 letras.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    labelText: 'E-mail',
                    controller: controllerEmailTEC,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty || !Validation.emailIsValid(value)) {
                        return 'Informe um e-mail válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    labelText: 'Password',
                    controller: controllerPasswordTEC,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe uma senha';
                      } else if (value.length < 3) {
                        return 'A senha precisa ter no mínimo 4 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: AppButton(
                      label: 'Salvar',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          NewUserDataEntity newUserDataEntity = NewUserDataEntity(
                            email: controllerEmailTEC.text.trim(),
                            password: controllerPasswordTEC.text.trim(),
                            username: controllerUsernameTEC.text.trim(),
                          );
                          controller.register(newUserDataEntity: newUserDataEntity);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
