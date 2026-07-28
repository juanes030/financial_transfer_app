import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_bloc.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/transfer_form.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  void initState() {
    super.initState();

    context.read<UsersBloc>().add(
          const LoadUsersRequested(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Realizar transferencia',
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: TransferForm(),
        ),
      ),
    );
  }
}