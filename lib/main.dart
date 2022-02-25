import 'package:before_start/app_module.dart';
import 'package:before_start/app_widget.dart';
import 'package:before_start/modules/design_system/design_sistem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final String applicationId = dotenv.env['applicationId']!;
  final String restApiKey = dotenv.env['restApiKey']!;
  final String baseUrl = dotenv.env['baseUrl']!;

  await Parse().initialize(applicationId, baseUrl, clientKey: restApiKey, autoSendSessionId: true);

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.ripple
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.primary
    ..backgroundColor = AppColors.background
    ..indicatorColor = AppColors.onBackground
    ..textColor = AppColors.secondary
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
