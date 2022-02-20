import 'package:before_start/modules/utils/formatters.dart';
import 'package:before_start/modules/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../design_system/design_sistem.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final controllerEmail = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Esqueceu a senha')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 200,
                child: Image.asset(AppImages.logo),
              ),
              const SizedBox(height: 16),
              const Text(
                'Você receberá um e-mail com informações para recuperar sua senha.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 8),
              const Text(
                'Caso não esteja encontrando a mensagem, verifique no email informado, sua caixa de SPAM.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      labelText: 'E-mail',
                      controller: controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      inputFormatters: [
                        LowerCaseTextFormatter(),
                      ],
                      autocorrect: true,
                      validator: (value) {
                        if (Validation.emailIsValid(value!)) {
                          return null;
                        } else {
                          return "E-mail inválido";
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: AppButton(
                        label: 'Enviar',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            doUserResetPassword();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void doUserResetPassword() async {
    final ParseUser user = ParseUser(null, null, controllerEmail.text.trim());
    final ParseResponse parseResponse = await user.requestPasswordReset();
    if (parseResponse.success) {
      AppDialog.showSuccess(
          context: context,
          message: 'Password reset instructions have been sent to email!',
          onPressed: () {
            Navigator.of(context).pop();
          });
    } else {
      AppDialog.showError(context: context, message: parseResponse.error!.message);
    }
  }
}
