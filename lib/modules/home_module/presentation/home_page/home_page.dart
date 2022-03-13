import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../design_system/design_sistem.dart';

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
        title: const Text('Login'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
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
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 156,
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 40),
          child: Column(
            children: [
              AppButton.secondary(
                label: 'Login',
                onPressed: () => Modular.to.pushNamed('/login_page'),
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Novo usuário',
                onPressed: () => Modular.to.pushNamed('/register_page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
