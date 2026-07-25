import 'package:financial_transfer_app/app/router/app_router.dart';
import 'package:financial_transfer_app/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Financial Transfer App',
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
    );
  }
}