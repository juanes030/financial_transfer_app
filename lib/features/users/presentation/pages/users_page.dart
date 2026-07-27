import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_bloc.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_event.dart';
import 'package:financial_transfer_app/features/users/presentation/bloc/users/users_state.dart';
import 'package:financial_transfer_app/features/users/presentation/widgets/user_card.dart';
import 'package:financial_transfer_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<UsersBloc>()..add(const LoadUsersRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Usuarios'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/users/create');
          },
          child: const Icon(Icons.person_add),
        ),
        body: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UsersFailure) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is UsersLoaded) {
              if (state.users.isEmpty) {
                return const Center(
                  child: Text(
                    'No hay usuarios registrados.',
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 80),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];

                  return UserCard(
                    user: user,
                    onEdit: () {
                      // Próximo paso.
                    },
                    onDelete: () {
                      context.read<UsersBloc>().add(
                            DeleteUserRequested(
                              user.id,
                            ),
                          );
                    },
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}