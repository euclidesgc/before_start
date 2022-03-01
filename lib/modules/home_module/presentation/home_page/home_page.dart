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
        title: const Text('Mentoria Before Start'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              height: 200,
              child: Image.asset(AppImages.logo),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppButton.secondary(
                  label: 'Continue',
                  onPressed: () => Modular.to.pushNamed('/login_page'),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: AppButton(
                    label: 'Game Start',
                    onPressed: () => Modular.to.pushNamed('/register_page'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
