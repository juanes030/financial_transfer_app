import 'package:financial_transfer_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:financial_transfer_app/features/auth/presentation/bloc/auth/auth_state.dart';
import 'package:financial_transfer_app/features/transfers/presentation/bloc/transfer/transfer_bloc.dart';
import 'package:financial_transfer_app/features/transfers/presentation/bloc/transfer/transfer_event.dart';
import 'package:financial_transfer_app/features/transfers/presentation/bloc/transfer/transfer_state.dart';
import 'package:financial_transfer_app/features/transfers/presentation/widgets/amount_text_field.dart';
import 'package:financial_transfer_app/features/transfers/presentation/widgets/source_account_card.dart';
import 'package:financial_transfer_app/features/transfers/presentation/widgets/transfer_success_dialog.dart';
import 'package:financial_transfer_app/features/transfers/presentation/widgets/user_dropdown.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_entity.dart';
import 'package:financial_transfer_app/features/users/domain/entities/user_role.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_bloc.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_event.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({super.key});

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final _formKey = GlobalKey<FormState>();

  final _amountController = TextEditingController();

  String? _sourceUserId;
  String? _destinationUserId;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _amountController.clear();

    setState(() {
      _sourceUserId = null;
      _destinationUserId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) async {
        if (state is TransferFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is TransferSuccess) {
          await showDialog(
            context: context,
            builder: (_) => TransferSuccessDialog(
              transfer: state.transfer,
            ),
          );

          if (!mounted) return;

          context.read<TransferBloc>().add(
                const ResetTransferStateRequested(),
              );

          context.read<UsersBloc>().add(
                const LoadUsersRequested(),
              );

          _clearForm();
        }
      },
      builder: (context, transferState) {
        final loading = transferState is TransferLoading;

        return BlocBuilder<UsersBloc, UsersState>(
          builder: (context, usersState) {
            if (usersState is UsersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (usersState is UsersFailure) {
              return Center(
                child: Text(usersState.message),
              );
            }

            if (usersState is! UsersLoaded) {
              return const SizedBox.shrink();
            }

            final List<UserEntity> users = usersState.users;

            final authState = context.watch<AuthBloc>().state;

            if (authState is! AuthAuthenticated) {
              return const SizedBox.shrink();
            }

            final currentUser = authState.user;

            // El usuario autenticado siempre será el origen.
            _sourceUserId ??= currentUser.id;

            // Usuarios disponibles para recibir la transferencia.
            final destinationUsers = users.where((user) {
              return user.id != currentUser.id &&
                  user.role != UserRole.admin;
            }).toList();

            return Form(
              key: _formKey,
              child: Column(
                children: [
                  SourceAccountCard(
                    user: currentUser,
                  ),
                  const SizedBox(height: 16),
                  UserDropdown(
                    label: 'Usuario destino',
                    users: destinationUsers,
                    selectedUserId: _destinationUserId,
                    onChanged: (value) {
                      setState(() {
                        _destinationUserId = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  AmountTextField(
                    controller: _amountController,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: loading
                          ? null
                          : () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              context.read<TransferBloc>().add(
                                    PerformTransferRequested(
                                      sourceUserId: _sourceUserId!,
                                      destinationUserId:
                                          _destinationUserId!,
                                      amount: int.parse(
                                        _amountController.text,
                                      ),
                                    ),
                                  );
                            },
                      child: loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Transferir',
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}