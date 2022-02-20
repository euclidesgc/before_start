import 'package:before_start/app_module.dart';
import 'package:before_start/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final String keyApplicationId = dotenv.env['keyApplicationId']!;
  final String keyClientKey = dotenv.env['keyClientKey']!;
  final String keyParseServerUrl = dotenv.env['keyParseServerUrl']!;

  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, autoSendSessionId: true);

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
