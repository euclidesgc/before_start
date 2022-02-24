import 'package:before_start/modules/design_system/design_sistem.dart';
import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ModularState<DashboardPage, DashboardController> {
  String nome = "";
  var numero = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Dashboard do Caio'),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Column(
                  children: [
                    Image.asset(AppImages.logo, width: 80),
                    const Text(
                      'Mentoria Before Start',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              //Obter estes itens do background
              ListTile(
                title: const Text('Roadmap'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Segunda Etapa'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  controller.logoutUsecase(
                      user: UserEntity(
                          objectId: "objectId",
                          username: "euclidesgc",
                          createdAt: DateTime(2022, 02, 22),
                          updatedAt: DateTime(2022, 02, 22),
                          emailVerified: true,
                          sessionToken: "r:54a70ffc5c33b4e99444d2b1379efe3a"));
                  Navigator.pop(context);
                  Modular.to.pushNamedAndRemoveUntil("/home", ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
        body: Container());
  }
}
