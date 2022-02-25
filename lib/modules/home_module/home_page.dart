import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../design_system/design_sistem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentoria Before Start'),
      ),
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
            AppButton(
              label: 'Fazer Login',
              onPressed: () => Modular.to.pushNamed('/login_page'),
            ),
            const SizedBox(height: 16),
            AppButton.secondary(
              label: 'Registre-se',
              onPressed: () => Modular.to.pushNamed('/register_page'),
            ),
            const SizedBox(height: 16),
            AppButton.secondary(
              label: 'TESTE',
              onPressed: () async {
                EasyLoading.show(status: "Carregando...", maskType: EasyLoadingMaskType.custom);
                await Future.delayed(const Duration(seconds: 3));
                EasyLoading.dismiss();
              },
            ),
          ],
        ),
      ),
    );
  }
}
