import 'package:financial_transfer_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:financial_transfer_app/features/auth/presentation/widgets/login_form.dart';
import 'package:financial_transfer_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Financial Transfer App'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 420,
                ),
                child: LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}