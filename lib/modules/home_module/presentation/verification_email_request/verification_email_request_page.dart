import '../../../utils/formatters.dart';
import '../../../utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../design_system/design_sistem.dart';
import 'verification_email_request_controller.dart';

class VerificationEmailRequestPage extends StatefulWidget {
  const VerificationEmailRequestPage({Key? key}) : super(key: key);

  @override
  _VerificationEmailRequestPageState createState() => _VerificationEmailRequestPageState();
}

class _VerificationEmailRequestPageState extends ModularState<VerificationEmailRequestPage, VerificationEmailRequestController> {
  final emailTEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Confirme seu Email')),
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
                'Você receberá um e-mail com um link para ativar sua conta.',
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
                      controller: emailTEC,
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
                            controller.verificationEmailRequest(email: emailTEC.text.trim());
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
}
