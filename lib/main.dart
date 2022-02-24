import 'package:before_start/app_module.dart';
import 'package:before_start/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final String applicationId = dotenv.env['applicationId']!;
  final String restApiKey = dotenv.env['restApiKey']!;
  final String baseUrl = dotenv.env['baseUrl']!;

  await Parse().initialize(applicationId, baseUrl, clientKey: restApiKey, autoSendSessionId: true);

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
