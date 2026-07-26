import 'package:financial_transfer_app/app/app.dart';
import 'package:financial_transfer_app/core/services/app_initializer.dart';
import 'package:financial_transfer_app/injection/injection.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  await getIt<AppInitializer>().initialize();

  runApp(const App());
}
