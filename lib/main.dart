import 'package:before_start/app_module.dart';
import 'package:before_start/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'YTcgCIMcdgOpYhD3mwWF8dQUSORswHH01lvx9bXG';
  const keyClientKey = 'Ruvo2Z4Xb3FB4ETruurZIDnnaSIQXagwVImA7dp8';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, autoSendSessionId: true);

  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
