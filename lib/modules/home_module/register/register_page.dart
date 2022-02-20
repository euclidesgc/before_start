import 'package:before_start/modules/design_system/design_sistem.dart';
import 'package:before_start/modules/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();
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
                    controller: controllerUsername,
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
                    controller: controllerEmail,
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
                    controller: controllerPassword,
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
                    height: 50,
                    child: AppButton(
                      label: 'Salvar',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          doUserRegistration();
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

  void doUserRegistration() async {
    final username = controllerUsername.text.trim();
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text.trim();

    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      AppDialog.showSuccess(
          context: context,
          message: 'User was successfully created!\nPlease verify your email before Login',
          onPressed: () async {
            Navigator.pop(context);
          });
    } else {
      AppDialog.showError(
        context: context,
        message: response.error!.message,
        onPressed: () => Navigator.of(context).pop(),
      );
    }
  }
}
