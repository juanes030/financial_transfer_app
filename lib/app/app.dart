import 'package:financial_transfer_app/app/router/app_router.dart';
import 'package:financial_transfer_app/app/theme/app_theme.dart';
import 'package:financial_transfer_app/features/transfers/presentation/bloc/transfer/transfer_bloc.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_bloc.dart';
import 'package:financial_transfer_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsersBloc>(
          create: (_) => getIt<UsersBloc>(),
        ),
        BlocProvider<TransferBloc>(
          create: (_) => getIt<TransferBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Financial Transfer App',
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}